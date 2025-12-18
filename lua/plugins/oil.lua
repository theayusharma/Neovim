return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-mini/mini.icons", -- or "nvim-tree/nvim-web-devicons"
  },
  opts = {
    default_file_explorer = true,
    use_default_keymaps = true,
    watch_for_directory_changes = true,
    columns = { "icon" },
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<CR>"] = "actions.select",
      ["q"] = "actions.close",
      ["<BS>"] = "actions.parent",
      ["<C-s>"] = "actions.select_split",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-t>"] = "actions.select_tab",
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "_", "<cmd>Oil --float<cr>", desc = "Open Oil in floating window" },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
