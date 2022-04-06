local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("configs.LSP.handlers").setup()
require("configs.LSP.cmp")
require("configs.LSP.lsp-installer")
require("configs.LSP.lsp-signature")
require("configs.LSP.null-ls")
