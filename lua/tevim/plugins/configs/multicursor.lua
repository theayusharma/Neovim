return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    { "<C-n>", mode = { "n", "x" } },
    { "<S-C-n>", mode = { "n", "x" } },
    { "<leader>s", mode = { "n", "x" } },
    { "<leader>S", mode = { "n", "x" } },
    { "<Up>", mode = { "n", "x" } },
    { "<Down>", mode = { "n", "x" } },
    { "<leader><Up>", mode = { "n", "x" } },
    { "<leader><Down>", mode = { "n", "x" } },
    { "<C-q>", mode = { "n", "x" } },
    { "<Left>", mode = { "n", "x" } },
    { "<Right>", mode = { "n", "x" } },
    { "<leader>x", mode = { "n", "x" } },
    { "<C-LeftMouse>", mode = { "n" } },
    { "<C-LeftDrag>", mode = { "n" } },
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
}