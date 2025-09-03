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
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup {
        on_attach = function(client, bufnr)
          print("TypeScript Tools attached to buffer " .. bufnr)
        end,
        settings = {
          formatter = "prettier",
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
          -- tsserver_path = ".npm/install/global/node_modules/typescript/bin/tsserver",

          -- tsserver_path = vim.fn.expand("$HOME") .. "/.bun/install/global/node_modules/typescript/bin/tsserver",
        }
      }
    end,
  },
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
            vim.api.nvim_buf_set_extmark(buf, ns, i - 1, e - 1, {
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
  {
    "sbdchd/neoformat",
    config = function()
      vim.cmd([[
			augroup fmt
			  autocmd!
			  autocmd BufWritePre * undojoin | Neoformat
			augroup END
		  ]])

      vim.g.neoformat_enabled_python = { 'black' }
      vim.g.neoformat_enabled_javascript = { 'prettier' }
      vim.g.neoformat_enabled_lua = { 'stylua' }

      vim.g.neoformat_verbose = 1
      vim.g.neoformat_run_all_formatters = 1
    end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    keys = {
      { "<C-n>",           mode = { "n", "x" } },
      { "<S-C-n>",         mode = { "n", "x" } },
      { "<leader>s",       mode = { "n", "x" } },
      { "<leader>S",       mode = { "n", "x" } },
      { "<Up>",            mode = { "n", "x" } },
      { "<Down>",          mode = { "n", "x" } },
      { "<leader><Up>",    mode = { "n", "x" } },
      { "<leader><Down>",  mode = { "n", "x" } },
      { "<C-q>",           mode = { "n", "x" } },
      { "<Left>",          mode = { "n", "x" } },
      { "<Right>",         mode = { "n", "x" } },
      { "<leader>x",       mode = { "n", "x" } },
      { "<C-LeftMouse>",   mode = { "n" } },
      { "<C-LeftDrag>",    mode = { "n" } },
      { "<C-LeftRelease>", mode = { "n" } },
    },
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set
      set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
      set({ "n", "x" }, "<S-C-n>", function() mc.matchAddCursor(-1) end)

      set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
      set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

      set({ "n", "x" }, "<Up>", function() mc.lineAddCursor(-1) end)
      set({ "n", "x" }, "<Down>", function() mc.lineAddCursor(1) end)
      set({ "n", "x" }, "<leader><Up>", function() mc.lineSkipCursor(-1) end)
      set({ "n", "x" }, "<leader><Down>", function() mc.lineSkipCursor(1) end)

      set("n", "<C-LeftMouse>", mc.handleMouse)
      set("n", "<C-LeftDrag>", mc.handleMouseDrag)
      set("n", "<C-LeftRelease>", mc.handleMouseRelease)

      set({ "n", "x" }, "<C-q>", mc.toggleCursor)

      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<Left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<Right>", mc.nextCursor)
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
        layerSet("n", "<Esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = {
      "echasnovski/mini.icons", -- or "nvim-tree/nvim-web-devicons"
    },
    opts = {
      default_file_explorer = true,
      use_default_keymaps = true,
      watch_for_directory_changes = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<CR>"] = "actions.select",
        ["q"] = "actions.close",
        ["<BS>"] = "actions.parent",
        ["<C-s>"] = "actions.select_split",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-t>"] = "actions.select_tab",
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>",         desc = "Open parent directory" },
      { "_", "<cmd>Oil --float<cr>", desc = "Open Oil in floating window" },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
  {
    "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    require("neoscroll").setup({
      -- Optional configuration
      scroll_duration = 1,
      mappings = {
        "<C-u>", "<C-d>", "zt", "zz", "zb"
      },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    })
  end,
}
}
