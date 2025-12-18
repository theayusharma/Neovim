-- local default_width = 30
--
-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   cmd = "Neotree",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "MunifTanjim/nui.nvim",
--   },
--
--   keys = {
--     {
--       "<C-e>",
--       "<cmd>Neotree toggle<cr>",
--       desc = "Toggle Neo-tree",
--     },
--   },
--
--   opts = {
--     close_if_last_window = true,
--     popup_border_style = "rounded",
--     enable_git_status = true,
--     enable_diagnostics = true,
--
--     window = {
--       position = "left",
--       width = default_width,
--       mappings = {
--         ["<space>"] = "none",
--       },
--     },
--
--     filesystem = {
--       follow_current_file = { enabled = true },
--       use_libuv_file_watcher = true,
--       filtered_items = {
--         visible = true,
--         hide_dotfiles = false,
--         hide_gitignored = false,
--       },
--     },
--
--     default_component_configs = {
--       container = {
--         enable_character_fade = true,
--       },
--
--       indent = {
--         indent_size = 2,
--         padding = 1,
--         with_markers = false, -- removes ugly lines
--         with_expanders = true,
--         expander_collapsed = "",
--         expander_expanded = "",
--       },
--
--       icon = {
--         folder_closed = "󰉋",
--         folder_open = "󰝰",
--         folder_empty = "󰉖",
--         default = "󰈚",
--         highlight = "NeoTreeFileIcon",
--       },
--
--       modified = {
--         symbol = "●",
--         highlight = "NeoTreeModified",
--       },
--
--       name = {
--         trailing_slash = false,
--         highlight = "NeoTreeFileName",
--       },
--
--       git_status = {
--         symbols = {
--           added = "",
--           modified = "",
--           deleted = "",
--           renamed = "󰁕",
--           untracked = "",
--           ignored = "",
--           unstaged = "󰄱",
--           staged = "",
--           conflict = "",
--         },
--       },
--     },
--   },
-- }

local default_width = 30
local expanded_width = 50

return {
  "nvim-neo-tree/neo-tree.nvim",

  -- override only keys LazyVim sets
  keys = {
    { "<leader>e", false }, -- free leader-e for yazi
    {
      "<C-e>",
      "<cmd>Neotree toggle<cr>",
      desc = "Toggle Neo-tree",
    },
  },

  -- buffer-local settings for neo-tree
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    },
  },

  source_selector = {
    winbar = true,
    statusline = false,
    sources = {
      {
        source = "filesystem",
        display_name = function()
          local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          local win = vim.api.nvim_get_current_win()
          local width = vim.api.nvim_win_get_width(win)
          local pad = math.floor((width - #name) / 2)
          return (pad > 0 and string.rep(" ", pad) or "") .. name
        end,
      },
    },
  },

  opts = {
    -- clean header without icons
    source_selector = {
      winbar = true,
      statusline = false,
      show_scrolled_off_parent_node = false,
      sources = {
        { source = "filesystem", display_name = " Files " },
        { source = "git_status", display_name = " Git " },
        { source = "buffers", display_name = " Buffers " },
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      bind_to_cwd = false,
    },

    window = {
      width = default_width,
      mappings = {
        -- expand / shrink width inside neo-tree
        ["e"] = function()
          local state = require("neo-tree.sources.manager").get_state("filesystem")
          local winid = state.winid
          if not (winid and vim.api.nvim_win_is_valid(winid)) then
            return
          end

          local width = vim.api.nvim_win_get_width(winid)
          if width <= default_width then
            vim.api.nvim_win_set_width(winid, expanded_width)
          else
            vim.api.nvim_win_set_width(winid, default_width)
          end
        end,
      },
    },
  },
}
