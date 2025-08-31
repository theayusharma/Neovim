return {
  "s1n7ax/nvim-window-picker",
  version = "v1.*",
  config = function()
    require("window-picker").setup({
      -- Your window-picker configuration (optional)
      hint = "floating-big-letter",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    })
  end,
}