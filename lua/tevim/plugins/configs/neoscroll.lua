return
{
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    require("neoscroll").setup({
      -- Optional configuration
      scroll_duration = 1,
      mappings = {
        "<C-u>", "<C-d>", "zt", "zz", "zb"
      },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    })
  end,
}
