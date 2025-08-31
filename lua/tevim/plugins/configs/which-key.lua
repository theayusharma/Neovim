return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    return require("tevim.plugins.configs.whichkey")
  end,
}