-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function namespace_segment(value)
  value = value:gsub("[^%w_]", "_")
  return value:match("^%d") and "_" .. value or value
end

local function namespace_from_project(file)
  local file_dir = vim.fs.dirname(file)
  local project = vim.fs.find(function(name)
    return name:lower():match("%.csproj$") ~= nil
  end, { path = file_dir, upward = true, type = "file", limit = 1 })[1]

  if not project then
    return
  end

  local project_dir = vim.fs.dirname(project)
  local project_contents = table.concat(vim.fn.readfile(project), "\n")
  local root_namespace = project_contents:match("<RootNamespace>%s*(.-)%s*</RootNamespace>")
  root_namespace = root_namespace and vim.trim(root_namespace) or ""
  if root_namespace == "" or root_namespace:find("$(", 1, true) then
    root_namespace = vim.fs.basename(project):gsub("%.csproj$", "")
  end

  local namespace = {}
  for segment in root_namespace:gmatch("[^.]+") do
    namespace[#namespace + 1] = namespace_segment(segment)
  end

  local relative_dir = vim.fs.relpath(project_dir, file_dir)
  if relative_dir and relative_dir ~= "." then
    for segment in relative_dir:gmatch("[^/]+") do
      namespace[#namespace + 1] = namespace_segment(segment)
    end
  end

  return table.concat(namespace, ".")
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = vim.api.nvim_create_augroup("dotfiles_csharp_namespace", { clear = true }),
  pattern = "*.cs",
  callback = function(event)
    local lines = vim.api.nvim_buf_get_lines(event.buf, 0, -1, false)
    if #lines ~= 1 or lines[1] ~= "" then
      return
    end

    local namespace = namespace_from_project(vim.api.nvim_buf_get_name(event.buf))
    if not namespace or namespace == "" then
      return
    end

    vim.api.nvim_buf_set_lines(event.buf, 0, -1, false, { "namespace " .. namespace .. ";", "" })
    local window = vim.fn.bufwinid(event.buf)
    if window ~= -1 then
      vim.api.nvim_win_set_cursor(window, { 2, 0 })
    end
  end,
  desc = "Add a namespace to new C# files",
})
