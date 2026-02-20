return {
  "terrortylor/nvim-comment",
  config = function()
    require("nvim_comment").setup()

    -- toggle comment
    vim.keymap.set("n", "<leader>cy", ":CommentToggle<CR>", { silent = true })
    vim.keymap.set("v", "<leader>cy", ":CommentToggle<CR>", { silent = true })
  end,
}
