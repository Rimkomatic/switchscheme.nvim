local M = {}

M.setup = function(opts)
	opts = opts or {}

	require("switchscheme.persistence").setup(opts)
	require("switchscheme.commands").register()

	local name = require("switchscheme.persistence").load()
	if name and name ~= "" then
		pcall(vim.cmd.colorscheme, name)
	end
end

return M
