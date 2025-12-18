return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
    set({ "n", "x" }, "<S-C-n>", function() mc.matchAddCursor(-1) end)

    set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
    set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

    set({ "n", "x" }, "<C-Up>", function() mc.lineAddCursor(-1) end)
    set({ "n", "x" }, "<C-Down>", function() mc.lineAddCursor(1) end)
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
}
