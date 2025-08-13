return {
	pickers = {
		find_files = { hidden = true },
		find_grep = { hidden = true },
	},
	defaults = {
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.6,
				results_width = 0.7,
			},
			vertical = { mirror = false },
			width = 0.9,
			height = 0.9,
			preview_cutoff = 120,
		},
		find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		prompt_prefix = "   ",
		selection_caret = "    ",
		entry_prefix = "    ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_ignore_patterns = { ".git/" },
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
          + require("telescope.actions").open_qflist,
        ["<esc>"] = require("telescope.actions").close,
        ["<CR>"] = function(prompt_bufnr)
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          local entry = action_state.get_selected_entry()

          if entry.filename then
            actions.close(prompt_bufnr)
            vim.cmd("edit " .. entry.filename)
            if entry.lnum then
              vim.schedule(function()
                vim.fn.cursor(entry.lnum, entry.col or 1)
              end)
            end
          else
            require("telescope.actions").select_default(prompt_bufnr)
          end
        end,
      },
    },	},
}
