local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("configs.LSP.handlers").on_attach,
		capabilities = require("configs.LSP.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("configs.LSP.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("configs.LSP.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("configs.LSP.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "jdtls" then
		return
	end

	if server.name == "solang" then
		local solang_opts = require("configs.LSP.settings.solang")
		opts = vim.tbl_deep_extend("force", solang_opts, opts)
	end

	if server.name == "solc" then
		local solc_opts = require("configs.LSP.settings.solc")
		opts = vim.tbl_deep_extend("force", solc_opts, opts)
	end

	if server.name == "emmet_ls" then
		local emmet_ls_opts = require("configs.LSP.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	server:setup(opts)
end)
