return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = " 󰄛 ", lang = "vim", title = " Kitty " },
        search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex", title = " Search " },
        search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex", title = " Search " },
        filter = { pattern = "^:%s*!", icon = " $ ", lang = "bash", title = " Shell " },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua", title = " Lua " },
        help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰋖 ", title = " Help " },
      },
    },
  },
}
