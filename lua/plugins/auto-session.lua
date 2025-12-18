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

    vim.keymap.set("n", "<leader>so", "<cmd>SessionSearch<CR>", { desc = "Open Session" })
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save Session" })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })
  end,
}
