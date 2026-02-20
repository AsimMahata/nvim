return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- Show hidden files in all pickers
        sources = {
          files = {
            hidden = true, -- Show dotfiles in fuzzy finder
          },
          grep = {
            hidden = true, -- Search in hidden files
          },
          explorer = {
            hidden = true, -- Show hidden files in file explorer
          },
        },
      },
    },
  },
}
