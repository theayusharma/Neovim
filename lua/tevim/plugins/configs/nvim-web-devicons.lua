return {
  "nvim-tree/nvim-web-devicons",
  event = "BufRead",
  opts = function()
    require("nvim-web-devicons").set_default_icon("󰈚")
    return require("tevim.plugins.configs.devicons")
  end,
}
