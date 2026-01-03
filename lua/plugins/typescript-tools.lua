return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function()
    require("typescript-tools").setup({
      on_attach = function(client)
        --conform x biome for formatting not this
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",

        --old stuff
        -- tsserver_path = ".npm/install/global/node_modules/typescript/bin/tsserver",
        -- tsserver_path = vim.fn.expand("$HOME") .. "/.bun/install/global/node_modules/typescript/bin/tsserver",
        -- tsserver_path = "bunx --bun typescript-language-server --stdio",
        -- tsserver_path = vim.fn.expand("$HOME") .. "/.bun/install/global/node_modules/typescript/lib/tsserver",

        -- node tsserver takes 109Mb vs bun  shebang takes 89Mb, no performance gains i guesss but yay bun
        -- bun shebang override tsserver
        -- --this doesn't work either, can't fundamentally remove node from tsserver
        tsserver_path = "bun --bun $HOME/.bun/bin/tsserver",
        -- tsserver_path = "tsserver",
      },
    })
  end,
}
