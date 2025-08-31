return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- Use stable branch instead of specific commit
  cmd = "Neotree",
  keys = {
    { "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = { "n", "v" } }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  init = function()
    -- Handle opening a directory
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = function()
    return require("tevim.plugins.configs.neotree")
  end,
}