return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  opts = {
    use_default_keymaps = true,
    keymaps = {
      ["q"] = "actions.close",
      ["<Esc>"] = "actions.close",
    },
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.8,
      border = "rounded",
      win_options = {
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").open_float()
      end,
      desc = "oil floating explorer",
    },
  },
}
