-- local M = {}
--
-- -- add overrides in here(eg: mason.nvim)
-- M.mason = {
-- 	ensure_installed = { "tree-sitter-cli" }
-- }

local augroup = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function(args)
    vim.lsp.buf.format({ async = true, bufnr = args.buf })
  end,
})

return M

