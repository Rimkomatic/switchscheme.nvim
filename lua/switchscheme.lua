local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Function to update line number colors
local updateLineNumberColors = function()
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
end

-- Function to set colorscheme and update highlights
local function SetColorscheme(scheme)
	vim.cmd("colorscheme " .. scheme)
	updateLineNumberColors()
end

-- Function to list all available colorschemes
local function ListColorschemes()
	return vim.fn.getcompletion('', 'color')
end

-- Telescope picker for colorschemes with live preview
local function PickColorscheme()
	local themes = ListColorschemes()
	pickers.new({
		prompt_title = "Select a Colorscheme",
		finder = finders.new_table(themes),
		sorter = conf.generic_sorter({}),
		layout_strategy = "center", -- Centered floating window
		layout_config = {
			width = 0.4,            -- 40% of screen width
			height = 0.4,           -- 40% of screen height
		},
		attach_mappings = function(prompt_bufnr, map)
			-- Apply the selected colorscheme when pressing Enter
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then
					SetColorscheme(selection[1])
				end
			end)

			-- Live preview: Change colorscheme as the user moves through options
			map("i", "<Down>", function()
				local selection = action_state.get_selected_entry()
				if selection then
					SetColorscheme(selection[1])
				end
				actions.move_selection_next(prompt_bufnr)
			end)

			map("i", "<Up>", function()
				local selection = action_state.get_selected_entry()
				if selection then
					SetColorscheme(selection[1])
				end
				actions.move_selection_previous(prompt_bufnr)
			end)

			return true
		end,
	}):find()
end

-- Create a command for opening the colorscheme picker
vim.api.nvim_create_user_command("PickColorscheme", PickColorscheme, {})

-- Keymap for opening the colorscheme picker
vim.keymap.set("n", "<leader>pcs", PickColorscheme)
