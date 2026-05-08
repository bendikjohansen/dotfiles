local DPRINT_CONFIGS = { "dprint.json", ".dprint.json", "dprint.jsonc", ".dprint.jsonc" }

local function has_dprint_config(path)
  path = (path and path ~= "") and path or vim.fn.getcwd()
  return vim.fs.find(DPRINT_CONFIGS, { upward = true, path = path })[1] ~= nil
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      opts.formatters.dprint = vim.tbl_deep_extend("force", opts.formatters.dprint or {}, {
        require_cwd = true,
        condition = function(_, ctx)
          return has_dprint_config(ctx.filename)
        end,
      })

      -- When dprint owns a markdown buffer, don't also run the LazyVim defaults.
      local function defer_to_dprint(name)
        local existing = (opts.formatters[name] or {}).condition
        opts.formatters[name] = vim.tbl_deep_extend("force", opts.formatters[name] or {}, {
          condition = function(self, ctx)
            local ft = vim.bo[ctx.buf].filetype
            if (ft == "markdown" or ft == "markdown.mdx") and has_dprint_config(ctx.filename) then
              return false
            end
            if existing then
              return existing(self, ctx)
            end
            return true
          end,
        })
      end

      defer_to_dprint("prettier")
      defer_to_dprint("markdownlint-cli2")
      defer_to_dprint("markdown-toc")

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.markdown = { "dprint", "prettier", "markdownlint-cli2", "markdown-toc" }
      opts.formatters_by_ft["markdown.mdx"] = { "dprint", "prettier", "markdownlint-cli2", "markdown-toc" }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          condition = function(ctx)
            return not has_dprint_config(ctx.filename)
          end,
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    optional = true,
    opts = { ensure_installed = { "dprint" } },
  },
}
