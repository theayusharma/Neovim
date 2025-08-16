local plugins = {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufRead",
		opts = function()
			require("nvim-web-devicons").set_default_icon("󰈚")
			return require("tevim.plugins.configs.devicons")
		end,
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	cmd = "Neotree",
	-- 	keys = { { mode = { "n", "v" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
	-- 	commit = "8afbb06081ce1e4beb5b18945d14a608b10babeb",
	-- 	deactivate = function()
	-- 		vim.cmd([[Neotree close]])
	-- 	end,
	-- 	init = function()
	-- 		vim.g.neo_tree_remove_legacy_commands = 1
	-- 		if vim.fn.argc(-1) == 1 then
	-- 			local stat = vim.loop.fs_stat(vim.fn.argv(0))
	-- 			if stat and stat.type == "directory" then
	-- 				require("neo-tree")
	-- 			end
	-- 		end
	-- 	end,
	-- 	opts = function()
	-- 		return require("tevim.plugins.configs.neotree")
	-- 	end,
	-- },
		
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			{
				"windwp/nvim-ts-autotag",
				ft = { "html", "javascript", "jsx", "typescript", "tsx", "svelte", "vue", "xml", "markdown" },
				opts = { enable_close_on_slash = false },
			},
		},
		opts = function()
			return require("tevim.plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- Use stable branch instead of specific commit
	cmd = "Neotree",
	keys = { 
		{ "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = { "n", "v" } }
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		-- Handle opening a directory
		if vim.fn.argc(-1) == 1 then
			local stat = vim.uv.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	opts = function()
		return require("tevim.plugins.configs.neotree")
	end,
},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"echasnovski/mini.indentscope",
				opts = { symbol = "│" },
			},
		},
		opts = function()
			return require("tevim.plugins.configs.blankline")
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ mode = "n", "<C-/>", "<Plug>(comment_toggle_linewise_current)",      desc = "Toggle Comment" },
			{ mode = "i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment(Insert)" },
			{ mode = "v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)",       desc = "Toggle Comment(Visual)" },
		},
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		cmd = "TodoTelescope",
		opts = { signs = false },
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = function()
			return require("tevim.plugins.configs.telescope")
		end,
	},
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	ft = { "gitcommit", "diff" },
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd({ "BufRead" }, {
	-- 			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
	-- 			callback = function()
	-- 				vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
	-- 					on_exit = function(_, return_code)
	-- 						if return_code == 0 then
	-- 							vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
	-- 							vim.schedule(function()
	-- 								require("lazy").load({ plugins = { "gitsigns.nvim" } })
	-- 							end)
	-- 						end
	-- 					end,
	-- 				})
	-- 			end,
	-- 			desc = "Load gitsigns only if git repository",
	-- 		})
	-- 	end,
	-- 	opts = function()
	-- 		return require("tevim.plugins.configs.gitsign")
	-- 	end,
	-- },
	{
	"lewis6991/gitsigns.nvim",
	ft = { "gitcommit", "diff" },
	init = function()
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
			callback = function()
				-- Use vim.uv instead of vim.loop (updated API)
				vim.fn.jobstart({ "git", "-C", vim.uv.cwd(), "rev-parse" }, {
					on_exit = function(_, return_code)
						if return_code == 0 then
							-- Safe deletion with error handling
							pcall(vim.api.nvim_del_augroup_by_name, "GitSignsLazyLoad")
							vim.schedule(function()
								require("lazy").load({ plugins = { "gitsigns.nvim" } })
							end)
						end
					end,
				})
			end,
			desc = "Load gitsigns only if git repository",
		})
	end,
	opts = function()
		return require("tevim.plugins.configs.gitsign")
	end,
},
	
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = function()
			return require("tevim.plugins.configs.whichkey")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{
				mode = { "n", "t", "v" },
				[[<C-`>]],
				"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
				{ desc = "Toggle Terminal" },
			},
		},
		version = "*",
		opts = {
			shading_factor = 0.2,
			highlights = { NormalFloat = { link = "NormalFloat" } },
			float_opts = { border = "none" },
		},
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				ft_ignore = { "neo-tree", "Outline" },
				segments = {
					{ sign = { namespace = { "diagnostic*" } } },
					{ sign = { namespace = { "gitsign" } },    click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, "  " },       click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, "  " },       click = "v:lua.ScFa" },
				},
			})
		end,
	},
	{
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
	},
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function(_, opts)
        require("tevim.plugins.configs.luasnips").luasnip(opts)
      end,
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = function()
        require("nvim-autopairs").setup({ 
          fast_wrap = {}, 
          disable_filetype = { "TelescopePrompt", "vim" } 
        })
      end,
    },
    {
      "luckasRanarison/tailwind-tools.nvim",
      config = function()
        require("tailwind-tools").setup({
          server = {
            override = true,
          },
        })
      end,
    },
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require("lspkind")
    
    -- Setup autopairs integration
    local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if ok then
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
    
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
        { name = 'nvim_lua' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
    })
    
    -- Command line completion
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
	,--------------------------------------------------------------
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
}

local check, _ = pcall(require, "custom")
if check then
	require("custom")
	local custom_plugins = require("custom.plugins")
	if #custom_plugins > 0 then
		for _, plugin in ipairs(custom_plugins) do
			table.insert(plugins, plugin)
		end
	end
else
	vim.cmd("TeVimCreateCustom")
end

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	ui = {
		backdrop = 100,
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
