local M = {}
local path = vim.fn.stdpath("state") .. "/switchscheme-colorscheme"
local enabled = false

function M.setup(opts)
	enabled = opts and opts.persist == true or false
end

function M.save(name)
	if not enabled then
		return
	end

	vim.fn.writefile({ name }, path)
end

function M.load()
	if not enabled then
		return nil
	end

	if vim.fn.filereadable(path) == 0 then
		return nil
	end

	local lines = vim.fn.readfile(path)
	return lines[1]
end

return M
