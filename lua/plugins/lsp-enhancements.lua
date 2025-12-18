return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      symbol_in_winbar = { show_file = false },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = { hint_enable = false },
  },
}
