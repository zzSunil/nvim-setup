local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}
require "lsp_signature".setup()
require 'lspconfig'.clangd.setup {}

-- ccls:
-- local lspconfig = require 'lspconfig'
-- lspconfig.ccls.setup {
-- 	init_options = {
-- 		-- compilationDatabaseDirectory = "build";
-- 		index = {
-- 			threads = 8;
-- 		};
-- 		-- clang = {
-- 		-- 	excludeArgs = { "-frounding-math" };
-- 		-- };
-- 	}
-- }
