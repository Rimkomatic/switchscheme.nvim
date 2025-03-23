local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

function M.colorscheme_picker()
	local colors = vim.fn.getcompletion('', 'color')

	pickers.new({}, {
		prompt_title = "Select Colorscheme",
		finder = finders.new_table({ results = colors }),
		sorter = conf.generic_sorter({}),
		layout_config = { width = 0.4, height = 0.4 },     -- ⬅ Smaller and cleaner UI
		attach_mappings = function(prompt_bufnr, map)
			local function apply_colorscheme()
				local selection = action_state.get_selected_entry()
				if selection then
					vim.cmd("colorscheme " .. selection[1])
					vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" }) 
					vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true }) 
				end
			end

			map("i", "<CR>", function()
				apply_colorscheme()
				actions.close(prompt_bufnr)
			end)

			map("i", "<Down>", function()
				actions.move_selection_next(prompt_bufnr)
				apply_colorscheme()
			end)

			map("i", "<Up>", function()
				actions.move_selection_previous(prompt_bufnr)
				apply_colorscheme()
			end)

			return true
		end,
	}):find()
end

return M
