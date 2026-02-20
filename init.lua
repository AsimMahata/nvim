-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h11"
  vim.g.neovide_scale_factor = 0.9

  -- small, tight padding
  vim.g.neovide_padding_top = 15
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_left = 5
  vim.g.neovide_padding_right = 5
end
