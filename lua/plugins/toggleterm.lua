local last_direction = "horizontal"
local last_size = 10

local function toggle_with_memory()
  local cmd = string.format("ToggleTerm size=%d direction=%s", last_size, last_direction)
  vim.cmd(cmd)
end

local function toggle_horizontal()
  last_direction = "horizontal"
  last_size = 10
  vim.cmd("ToggleTerm size=10 direction=horizontal")
end

local function toggle_vertical()
  last_direction = "vertical"
  last_size = 50
  vim.cmd("ToggleTerm size=50 direction=vertical")
end

local function toggle_float()
  last_direction = "float"
  vim.cmd("ToggleTerm direction=float")
end

return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    {
      mode = { "n", "t", "v" },
      [[<C-`>]],
      toggle_with_memory,
    },
  },
  version = "*",
  opts = {
    shading_factor = 0.3,
    shade_terminals = true,
    highlights = {
      Normal = { link = "Normal" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
    },
    float_opts = {
      border = "rounded",
      width = function()
        return math.floor(vim.o.columns * 0.85)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      winblend = 3,
      title_pos = "center",
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return "  󰆍  Terminal #" .. term.id .. "  "
      end,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "toggleterm",
      callback = function()
        vim.opt_local.winbar = "%#ToggleTermTitle#  󰆍  Terminal  %*"
      end,
    })

    vim.api.nvim_set_hl(0, "ToggleTermTitle", {
      fg = "#7dcfff",
      bg = "#1a1b26",
      bold = true,
    })

    local map = vim.keymap.set
    local mopts = { noremap = true, silent = true }

    map({ "n", "v" }, "<Leader>t1", function()
      last_direction = "horizontal"
      last_size = 10
      vim.cmd("1ToggleTerm size=10 direction=horizontal")
    end, mopts)
    map({ "n", "v" }, "<Leader>t2", "<cmd>2ToggleTerm<CR>", mopts)
    map({ "n", "v" }, "<Leader>t3", "<cmd>3ToggleTerm<CR>", mopts)
    map({ "n", "v" }, "<Leader>t4", "<cmd>4ToggleTerm<CR>", mopts)
    map({ "n", "v" }, "<Leader>tf", toggle_float, mopts)
    map({ "n", "v" }, "<Leader>th", toggle_horizontal, mopts)
    map({ "n", "v" }, "<Leader>tv", toggle_vertical, mopts)

    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], mopts)
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], mopts)
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], mopts)
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], mopts)
    map("t", "<Esc><Esc>", [[<C-\><C-n>]], mopts)
  end,
}
