return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- leader + e → open yazi in current working directory
    {
      "<leader>e",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in current working directory",
    },

    -- double space → resume / toggle last yazi session
    {
      "<space><space>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume last yazi session",
    },

    -- leader + o + w → open yazi at the current file
    {
      "<leader>ow",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at current file",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
    yazi_floating_window_border = "rounded",
  },
}
