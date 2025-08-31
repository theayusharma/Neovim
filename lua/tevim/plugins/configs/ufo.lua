return {
  "kevinhwang91/nvim-ufo",
  event = { "BufReadPost", "BufNewFile" },
  commit = "aa2e676af592b4e99c105d80d6eafd1afc215d99",
  dependencies = "kevinhwang91/promise-async",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require("ufo").setup()
  end,
}