-- return {
-- 	highlight = {
-- 		enable = true,
-- 		use_languagetree = true,
-- 	},
-- 	indent = { enable = true },
-- 	ensure_installed = { "lua", "vim", "vimdoc" , "c", "cpp", "go"},
-- 	auto_install = true,
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascript", "jsx", "typescript", "tsx", "svelte", "vue", "xml", "markdown" },
      opts = { enable_close_on_slash = false },
    },
  },
  opts = function()
    return require("tevim.plugins.configs.treesitter")
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
