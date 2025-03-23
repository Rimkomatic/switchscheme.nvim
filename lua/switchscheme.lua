local updateLineNumberColors = function()
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
end

vim.api.nvim_create_user_command("LineColor", updateLineNumberColors, {})
vim.keymap.set("n", "<leader>clc", updateLineNumberColors)


function SetColorscheme(scheme)
	vim.cmd("colorscheme " .. scheme)
	updateLineNumberColors()
end

function ListColorschemes()
	local themes = {}
	for _, theme in ipairs(vim.fn.getcompletion('', 'color')) do
		table.insert(themes, theme)
	end
	return themes
end

-- Create SetColorscheme command
vim.api.nvim_create_user_command('SetColorscheme', function(opts)
	SetColorscheme(opts.args)
end, {
	nargs = 1,
	complete = function(lead)
		return vim.fn.getcompletion(lead, 'color')
	end,
})

-- Create ListColorschemes command
vim.api.nvim_create_user_command('ListColorschemes', function()
	local available_themes = ListColorschemes()
	print("Available colorschemes:")
	for _, theme in ipairs(available_themes) do
		print(theme)
	end
end, {})
