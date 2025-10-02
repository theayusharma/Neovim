local plugins = {
  require("tevim.plugins.configs.mini"),
  require("tevim.plugins.configs.nvim-web-devicons"),
  require("tevim.plugins.configs.neo-tree"),
  require("tevim.plugins.configs.indent-blankline"),
  require("tevim.plugins.configs.treesitter"),
  require("tevim.plugins.configs.todo-comments"),
  require("tevim.plugins.configs.fzf-lua"),
  require("tevim.plugins.configs.dressing"),
  require("tevim.plugins.configs.comment"),
  require("tevim.plugins.configs.which-key"),
  require("tevim.plugins.configs.toggleterm"),
  require("tevim.plugins.configs.gitsigns"),
  require("tevim.plugins.configs.vim-illuminate"),
  require("tevim.plugins.configs.ufo"),
  require("tevim.plugins.configs.statuscol"),
  require("tevim.plugins.configs.nvim-cmp"),
  require("tevim.plugins.configs.lspconfig"),
  require("tevim.plugins.configs.colorizer"),
  require("tevim.plugins.configs.multicursor"),
  require("tevim.plugins.configs.markdown-preview"),
  require("tevim.plugins.configs.neoscroll"),
  require("tevim.plugins.configs.typescript-tools"),
  require("tevim.plugins.configs.ts-autotag"),
  require("tevim.plugins.configs.autopairs"),
  require("tevim.plugins.configs.auto-session"), --for some reason left neotree gets a blank spave at top if i enavle this, but usefull plugin
  -- require("tevim.plugins.configs.window-picker"), i dont know what its need {
  -- require("tevim.plugins.configs.neoformat"), managed by built in formatter i guess , so no need of this
  -- these might cause error, keep an eyey op 
  --  mini.icons 
--     neoformat 
  --   nvim-window-picker 
    -- oil.nvim 

  {
    "MunifTanjim/nui.nvim",
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
  },
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
