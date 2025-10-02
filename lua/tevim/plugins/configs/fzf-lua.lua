return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        height = 0.9,
        width = 0.9,
        preview = { horizontal = 'right:60%' },
      },
      -- fzf_opts = { ["--layout"] = "reverse" },
    })

    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fw", fzf.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>fs", fzf.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>fc", fzf.git_commits, { desc = "Git commits" })
  end,
}
