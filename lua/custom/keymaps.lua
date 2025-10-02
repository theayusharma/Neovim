vim.keymap.set("n", "<A-Tab>", function()
  require("fzf-lua").buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    previewer = false,
    layout_strategy = "vertical",
    layout_config = {
      height = 0.4,
      width = 0.5,
    },
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<A-Tab>", "move_selection_next")
      map("n", "<A-Tab>", "move_selection_next")
      return true
    end,
  })
end, { desc = "Switch buffers" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
