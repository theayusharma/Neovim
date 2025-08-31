return {
  "windwp/nvim-autopairs",
  -- event = "InsertEnter",
  -- opts = function() return require("config.nvim-autopairs") end,
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    local cmp_status_ok, cmp = pcall(require, "cmp")
    local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if cmp_status_ok and cmp_autopairs_status_ok then
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end
  end,
}