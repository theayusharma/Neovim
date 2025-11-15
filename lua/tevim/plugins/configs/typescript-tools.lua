return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function()
    require("typescript-tools").setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        print("TypeScript Tools attached to buffer " .. bufnr)
      end,
      settings = {
        formatter = "prettier",
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        -- tsserver_path = ".npm/install/global/node_modules/typescript/bin/tsserver",
        -- tsserver_path = vim.fn.expand("$HOME") .. "/.bun/install/global/node_modules/typescript/bin/tsserver",
        -- tsserver_path = "bunx --bun typescript-language-server --stdio",

        tsserver_path = vim.fn.expand("$HOME") .. "/.bun/install/global/node_modules/typescript/lib/tsserver",
      }
    }
  end,
}
