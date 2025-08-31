return {
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
}