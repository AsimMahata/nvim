return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      local_config_file_name = ".competitest.lua",

      floating_border = "rounded",
      floating_border_highlight = "FloatBorder",

      picker_ui = {
        width = 0.2,
        height = 0.3,
        mappings = {
          focus_next = { "j", "<down>", "<Tab>" },
          focus_prev = { "k", "<up>", "<S-Tab>" },
          close = { "<esc>", "<C-c>", "q", "Q" },
          submit = "<cr>",
        },
      },

      editor_ui = {
        popup_width = 0.4,
        popup_height = 0.6,
        show_nu = true,
        show_rnu = false,
        normal_mode_mappings = {
          switch_window = { "<C-h>", "<C-l>", "<C-i>" },
          save_and_close = "<C-s>",
          cancel = { "q", "Q" },
        },
        insert_mode_mappings = {
          switch_window = { "<C-h>", "<C-l>", "<C-i>" },
          save_and_close = "<C-s>",
          cancel = "<C-q>",
        },
      },

      runner_ui = {
        interface = "popup",
        show_nu = true,
        show_rnu = false,
        mappings = {
          run_again = "R",
          run_all_again = "<C-r>",
          kill = "K",
          kill_all = "<C-k>",
          view_input = { "i", "I" },
          view_output = { "a", "A" },
          view_stdout = { "o", "O" },
          view_stderr = { "e", "E" },
          toggle_diff = { "d", "D" },
          close = { "q", "Q" },
        },
      },

      save_current_file = true,
      save_all_files = false,

      compile_directory = ".",
      compile_command = {
        c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },

      running_directory = ".",
      run_command = {
        c = { exec = "./$(FNOEXT)" },
        cpp = { exec = "./$(FNOEXT)" },
        python = { exec = "python", args = { "$(FNAME)" } },
      },

      maximum_time = 5000,
      output_compare_method = "squish",
      view_output_diff = true,

      -- TESTCASES
      testcases_directory = ".",
      testcases_use_single_file = true,
      testcases_single_file_format = "$(FNOEXT).testcases",

      -- RECEIVING
      received_files_extension = "cpp",

      received_problems_path = "$(CWD)/cp/$(PROBLEM).$(FEXT)",
      received_contests_directory = "$(CWD)/cp",
      received_contests_problems_path = "$(PROBLEM).$(FEXT)",

      received_problems_prompt_path = true,
      received_contests_prompt_directory = true,
      received_contests_prompt_extension = true,

      open_received_problems = true,
      open_received_contests = true,
      replace_received_testcases = false,

      companion_port = 27121,

      -- ✅ AUTO RECEIVE ON STARTUP
      start_receiving_persistently_on_setup = true,
    })

    -- ✅ KEYBIND: run all testcases
    vim.keymap.set("n", "<leader>z", "<cmd>CompetiTest run<CR>", { silent = true })
  end,
}
