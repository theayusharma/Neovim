local overrides = require("custom.configs.overrides")

return {
{
 "echasnovski/mini.nvim", 
 version = false,
 config = function()
   require('mini.pairs').setup()
 end
},

{
 "mattn/emmet-vim",
 ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
},

{
 "windwp/nvim-autopairs",
 event = "InsertEnter",
 config = function()
   require("nvim-autopairs").setup({
     check_ts = true,
     ts_config = {
       lua = {'string'},
       javascript = {'template_string'},
       java = false,
     }
   })
 end,
},

{
  "windwp/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  ft = { "html", "javascript", "typescript", "jsx", "tsx", "vue", "svelte" },
  config = function()
    require('nvim-ts-autotag').setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
      },
      per_filetype = {
        ["html"] = {
          enable_close = true
        }
      }
    })
  end,
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
    require("mason").setup({
      ensure_installed = {
        "tree-sitter-cli",
      },
    })
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
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
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
{
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- optional but recommended
    "nvim-lua/plenary.nvim",         -- required
    "MunifTanjim/nui.nvim",          -- UI
    "nvim-treesitter/nvim-treesitter" -- syntax highlighting
  },
  opts = {
    -- optional: set defaults here
    lang = "cpp" -- or "python", "golang", etc.
  },
  config = function(_, opts)
    require("leetcode").setup(opts)
  end
}
,
{
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "html" },
      indent = { enable = true },
    }
  end,
}
}
