-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Disable continuations
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- mine
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- horizontal

vim.keymap.set("n", "<A-h>", function()
  -- check if a terminal window already exists
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- open PowerShell in a right split
  vim.cmd("split")
  vim.cmd("wincmd j")
  vim.cmd("terminal")
end)

-- vertical

vim.keymap.set("n", "<A-t>", function()
  -- check if a terminal window already exists
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- open PowerShell in a right split
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("terminal pwsh.exe")
end)
