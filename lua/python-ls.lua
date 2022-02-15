require "lsp_signature".setup()
require'lspconfig'.pyright.setup{
	cmd_env = {VIRTUAL_ENV = "$HOMEl/miniconda3/envs/dev"};
}
