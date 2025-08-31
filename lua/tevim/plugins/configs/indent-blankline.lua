return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "echasnovski/mini.indentscope",
      opts = { symbol = "│" },
    },
  },
  opts = function()
    return require("tevim.plugins.configs.blankline")
  end,
}