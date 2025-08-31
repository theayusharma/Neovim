return {
  "sbdchd/neoformat",
  config = function()
    vim.cmd([[
      augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
      augroup END
    ]])

    vim.g.neoformat_enabled_python = {'black'}
    vim.g.neoformat_enabled_javascript = {'prettier'}
    vim.g.neoformat_enabled_lua = {'stylua'}

    vim.g.neoformat_verbose = 1
    vim.g.neoformat_run_all_formatters = 1
  end,
}