local M = {}
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.inlay_hints = true

M.on_attach = function(_, bufnr)
	if M.inlay_hints then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) -- Updated API
	end
	
	-- Check if lsp_signature is available before calling
	local ok, lsp_signature = pcall(require, "lsp_signature")
	if ok then
		lsp_signature.on_attach({
			bind = true,
			handler_opts = { border = "rounded" },
		}, bufnr)
	end
end

-- Updated capabilities setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities.offsetEncoding = { "utf-16", "utf-8" }

-- Updated diagnostic configuration
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	signs = { 
		text = { 
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌶"
		}
	},
	float = {
		suffix = "",
		header = { "  Diagnostics", "String" },
		prefix = function(_, _, _) -- Fixed function parameters
			return "  ", "String"
		end,
	},
})

-- Simplified sign definition (works for all Neovim versions)
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
	{ name = "DiagnosticSignHint", text = "󰌶" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { 
		texthl = sign.name, 
		text = sign.text, 
		numhl = "" 
	})
end

-- LSP server setup
lspconfig.lua_ls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	settings = {
		Lua = {
			diagnostics = { 
				globals = { "vim" },
				-- Disable undefined global warnings
				disable = { "missing-fields" }
			},
			workspace = { 
				checkThirdParty = false,
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true)
			},
			telemetry = { enable = false }, -- Disable telemetry
		},
	},
})

return M
-- local M = {}
--
-- local lspconfig = require("lspconfig")
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
-- M.inlay_hints = true
--
-- M.on_attach = function(_, bufnr)
-- 	if M.inlay_hints then
-- 		vim.lsp.inlay_hint.enable(true)
-- 	end
-- 	require("lsp_signature").on_attach({
-- 		bind = true,
-- 		handler_opts = { border = "rounded" },
-- 	}, bufnr)
-- end
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- M.capabilities.offsetEncoding = { "utf-16", "utf-8" }
--
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	severity_sort = true,
-- 	signs = { text = { [1] = "", [2] = "", [3] = "", [4] = "󰌶" } },
-- 	float = {
-- 		suffix = "",
-- 		header = { "  Diagnostics", "String" },
-- 		prefix = function(_, _, _)
-- 			return "  ", "String"
-- 		end,
-- 	},
-- })
-- if vim.fn.has("nvim-0.9") == 1 then
-- 	vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
-- 	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
-- 	vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
-- 	vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
-- end
--
-- lspconfig.lua_ls.setup({
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = { globals = { "vim" } },
-- 			workspace = { checkThirdParty = false },
-- 		},
-- 	},
-- })
--
-- return M
