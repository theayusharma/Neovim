return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    require("auto-session").setup({
      auto_session_enable = true,
      auto_save = true,
      auto_restore = true,
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = true,
      },
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      cwd_change_handling = true,
    })
    local map = vim.keymap.set
    map("n", "<leader>so", "<cmd>AutoSession search<CR>", { desc = "Open Session" })
    map("n", "<leader>ss", "<cmd>AutoSession save<CR>", { desc = "Save Session" })
    map("n", "<leader>sr", "<cmd>AutoSession restore<CR>", { desc = "Restore Session" })
    map("n", "<leader>sd", "<cmd>AutoSession delete<CR>", { desc = "Delete Session" })
  end,
}
