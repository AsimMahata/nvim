-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable conceal in JSON / JSONC
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.opt.list = false

-- Tabs: width = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- F5: Compile & run C++ (Windows)
vim.keymap.set("n", "<F5>", function()
  local filepath = vim.fn.expand("%:p")
  local file_no_ext = vim.fn.expand("%:t:r")
  local output = file_no_ext .. ".exe"

  vim.cmd("write")
  vim.cmd('!g++ -std=c++20 -Wall -DLOCAL "' .. filepath .. '" -o "' .. output .. '"')
  vim.cmd('!cmd /c start cmd /c "' .. output .. ' & echo. & echo Press any key to exit... & pause >nul"')
end, { noremap = true, silent = true })
