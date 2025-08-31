return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = { filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}