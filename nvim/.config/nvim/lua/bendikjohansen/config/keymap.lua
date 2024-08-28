vim.keymap.set("n", "<leader>sv", function()
    vim.cmd("source $MYVIMRC")
    print("Sourced configuration.")
end)

