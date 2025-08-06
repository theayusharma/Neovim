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

  

{
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup({
      ensure_installed = {
        "tree-sitter-cli",
        "pyright",
        "gopls",
        "rust_analyzer",
        "clangd",
        "tailwindcss-language-server",
      },
    })

    require("mason-lspconfig").setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    lspconfig.clangd.setup({ capabilities = capabilities })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      root_dir = function(fname)
        local root_pattern = require("lspconfig").util.root_pattern(
          "tailwind.config.cjs",
          "tailwind.config.js",
          "postcss.config.js"
        )
        return root_pattern(fname)
      end,
      filetypes = { "html", "javascript", "typescript", "jsx", "tsx", "vue", "svelte", "css" },
    })
  end
},

  

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      {
        "luckasRanarison/tailwind-tools.nvim",
        config = function()
          require("tailwind-tools").setup({
            server = {
              override = false,
            },
          })
        end,
      },
    },
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      local lspkind = require("lspkind")
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
        }),
        formatting = {
          format = lspkind.cmp_format({
            before = require("tailwind-tools.cmp").lspkind_format,
          }),
        },
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
