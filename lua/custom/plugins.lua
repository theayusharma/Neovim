local overrides = require("custom.configs.overrides")

return { 
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
  },

  -- {
  --   -- Tailwind CSS LSP
  --   "neovim/nvim-lspconfig",
  --   dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = { "tailwindcss", "tsserver", "pyright", "gopls", "rust_analyzer" }
  --     })
  --     
  --     local lspconfig = require("lspconfig")
  --     local capabilities = require('cmp_nvim_lsp').default_capabilities()
  --     
  --     -- LSP Servers setup
  --     lspconfig.tailwindcss.setup({})
  --     lspconfig.tsserver.setup({
  --       capabilities = capabilities,
  --       on_attach = function(client)
  --         client.server_capabilities.documentFormattingProvider = false
  --       end,
  --     })
  --     lspconfig.pyright.setup({ capabilities = capabilities })
  --     lspconfig.gopls.setup({ capabilities = capabilities })
  --     lspconfig.rust_analyzer.setup({ capabilities = capabilities })
  --   end
  -- },

{
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "tailwindcss", "pyright", "gopls", "rust_analyzer", "clangd" }, -- removed tsserver from here
    })

    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- tailwindcss setup
    lspconfig.tailwindcss.setup({})

    -- -- tsserver using global binary
    -- lspconfig.tsserver.setup({
    --   cmd = { "typescript-language-server", "--stdio" },
    --   capabilities = capabilities,
    --   on_attach = function(client)
    --     client.server_capabilities.documentFormattingProvider = false
    --   end,
    -- })

    -- other servers
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
  end
},
  {
    -- Tailwind CSS color preview
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,  -- Enable Tailwind CSS color highlighting
          mode = "background",
        }
      })
    end
  },

  {
    -- Autocompletion plugins
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },
{
  "kdheepak/lazygit.nvim",
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
},

{
"s1n7ax/nvim-window-picker",
version = "v1.*",
config = function()
  require("window-picker").setup({
    -- Your window-picker configuration (optional)
    hint = "floating-big-letter",
    filter_rules = {
      include_current_win = false,
      autoselect_one = true,
      bo = {
        filetype = { "neo-tree", "neo-tree-popup", "notify" },
        buftype = { "terminal", "quickfix" },
      },
    },
  })
end,
},
{
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("typescript-tools").setup {}
  end,
},
}
