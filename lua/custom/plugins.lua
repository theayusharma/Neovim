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

-- {
--  "windwp/nvim-autopairs",
--  event = "InsertEnter",
--  config = function()
--    require("nvim-autopairs").setup({
--      check_ts = true,
--      ts_config = {
--        lua = {'string'},
--        javascript = {'template_string'},
--        java = false,
--      }
--    })
--  end,
-- },
{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		-- opts = function() return require("config.nvim-autopairs") end,
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			local cmp_status_ok, cmp = pcall(require, "cmp")
			local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
			if cmp_status_ok and cmp_autopairs_status_ok then
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
			end
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
--   "neovim/nvim-lspconfig",
--   dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
--   config = function()
--     require("mason").setup({
--       ensure_installed = {
--         "tree-sitter-cli",
--         "pyright",
--         "gopls",
--         "rust_analyzer",
--         "clangd",
--         "tailwindcss-language-server",
--       },  
--         automatic_installation = true,
--     })
--
--     require("mason-lspconfig").setup()
--
--     local capabilities = require('cmp_nvim_lsp').default_capabilities()
--     local lspconfig = require("lspconfig")
--
--     lspconfig.pyright.setup({ capabilities = capabilities })
--     lspconfig.gopls.setup({ capabilities = capabilities })
--     lspconfig.rust_analyzer.setup({ capabilities = capabilities })
--     lspconfig.clangd.setup({ capabilities = capabilities })
--
--     lspconfig.tailwindcss.setup({
--       capabilities = capabilities,
--       root_dir = function(fname)
--         local root_pattern = require("lspconfig").util.root_pattern(
--           "tailwind.config.cjs",
--           "tailwind.config.js",
--           "postcss.config.js"
--         )
--         return root_pattern(fname)
--       end,
--       filetypes = { "html", "javascript", "typescript", "jsx", "tsx", "vue", "svelte", "css" },
--     })
--   end
-- },
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    dependencies = {
      "windwp/nvim-autopairs",
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
      -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      -- cmp.event:on(
      --   'confirm_done',
      --   cmp_autopairs.on_confirm_done()
      -- )
      local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if ok then
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end

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
  --goated typescript thing, never made me sad
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
-- {
--   "nvim-treesitter/nvim-treesitter",
--   config = function()
--     require("nvim-treesitter.configs").setup {
--       ensure_installed = { "html" },
--       indent = { enable = true },
--     }
--   end,
-- },
{
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        tailwind = true,
        mode = "background",
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      },
    },
    config = function(_, opts)
      local ok, colorizer = pcall(require, "colorizer")
      if not ok then return end
      colorizer.setup(opts)

      local ns = vim.api.nvim_create_namespace("ColorizerInlineSwatch")
      local function add_swatch(buf)
        vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        for i, line in ipairs(lines) do
          for s, e in line:gmatch("()#%x%x%x%x%x%x()") do
            vim.api.nvim_buf_set_extmark(buf, ns, i - 1, e, {
              virt_text = { { " ███", "Normal" } },
              virt_text_pos = "inline",
              hl_mode = "combine",
              priority = 200,
            })
          end
        end
      end

      local grp = vim.api.nvim_create_augroup("ColorizerInlineAttach", { clear = true })
      vim.api.nvim_create_autocmd({ "BufReadPost", "TextChanged", "TextChangedI" }, {
        group = grp,
        callback = function(args) add_swatch(args.buf) end,
      })
    end,
  },
	-- {
	-- 	"sbdchd/neoformat", 
	-- 	config = function()
	-- 	  vim.cmd([[
	-- 		augroup fmt
	-- 		  autocmd!
	-- 		  autocmd BufWritePre * undojoin | Neoformat
	-- 		augroup END
	-- 	  ]])
	--
	-- 	  vim.g.neoformat_enabled_python = {'black'}
	-- 	  vim.g.neoformat_enabled_javascript = {'prettier'}
	-- 	  vim.g.neoformat_enabled_lua = {'stylua'}
	--
	-- 	  vim.g.neoformat_verbose = 1
	-- 	  vim.g.neoformat_run_all_formatters = 1
	-- 	end,
	--   },
    {
      'smoka7/multicursors.nvim',
      event = 'VeryLazy',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'nvimtools/hydra.nvim',
      },
      opts = {
        generate_hints = {
          normal = true,
          insert = true,
          extend = true,
        },
      },
      cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor', 'MCword' },
      config = function(_, opts)
        require('multicursors').setup(opts)
      end,
      keys = {
        {
          '<C-d>',
          '<cmd>MCstart<cr>',
          mode = 'n',
          desc = 'Start multicursor on word',
        },
        {
          '<C-d>',
          '<cmd>MCvisual<cr>',
          mode = 'v',
          desc = 'Start multicursor on visual selection',
        },
      },
    },
}
