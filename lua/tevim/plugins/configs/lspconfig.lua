return
{
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
  dependencies = {
    {
      "nvimdev/lspsaga.nvim",
      opts = { symbol_in_winbar = { show_file = false } },
    },
    {
      "williamboman/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonUpdate" },
      opts = function()
        return require("tevim.plugins.configs.mason")
      end,
    },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "ray-x/lsp_signature.nvim",
      opts = { hint_enable = false },
    },
  },
  config = function()
    pcall(function() require("tevim.plugins.configs.lspconfig") end)

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "gopls",
        "rust_analyzer",
        "clangd",
        "tailwindcss",
      },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })

    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = { "clangd", "--background-index" },
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      root_dir = function(fname)
        local util = require("lspconfig").util
        return util.root_pattern(
          "tailwind.config.cjs",
          "tailwind.config.js",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts"
        )(fname)
      end,
      filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "svelte",
      },
    })
  end,
}
