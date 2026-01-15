return {
  {
    -- Telescope core plugin
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- File browser extension
      "nvim-telescope/telescope-file-browser.nvim",
    },

    -- Configure telescope + extensions
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      -------------------------------------------------------------------------
      -- KEYMAPS FOR TELESCOPE
      -------------------------------------------------------------------------

      local keymap = vim.keymap.set

      -- ;f → Find files
      keymap("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

      -- ;r → Live grep
      keymap("n", ";r", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

      -- \\ → Buffers
      keymap("n", "\\\\", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })

      -- ;t → Help tags
      keymap("n", ";t", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

      -- ;; → Resume last telescope picker
      keymap("n", ";;", "<cmd>Telescope resume<CR>", { desc = "Resume Telescope" })

      -- ;e → Diagnostics
      keymap("n", ";e", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })

      -- ;s → Treesitter symbols
      keymap("n", ";s", "<cmd>Telescope treesitter<CR>", { desc = "Symbols" })

      -- sf → File Browser (current buffer's directory)
      keymap("n", "sf", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File Browser" })

      -------------------------------------------------------------------------
      -- FILE BROWSER EXTENSION SETTINGS
      -------------------------------------------------------------------------

      opts = opts or {}
      opts.extensions = {
        file_browser = {
          theme = "dropdown",

          -- Replace netrw with telescope-file-browser
          hijack_netrw = true,

          mappings = {
            ["n"] = {
              -- N → create new file
              ["N"] = fb_actions.create,

              -- h → go to parent directory
              ["h"] = fb_actions.goto_parent_dir,

              -- / → enter search mode
              ["/"] = function()
                vim.cmd("startinsert")
              end,

              -- <C-u> → move 10 selections up
              ["<C-u>"] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,

              -- <C-d> → move 10 selections down
              ["<C-d>"] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,

              -- PageUp / PageDown → preview scrolling
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }

      -------------------------------------------------------------------------
      -- SETUP TELESCOPE AND LOAD EXTENSION
      -------------------------------------------------------------------------
      telescope.setup(opts)

      -- Load file browser extension
      telescope.load_extension("file_browser")
    end,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
