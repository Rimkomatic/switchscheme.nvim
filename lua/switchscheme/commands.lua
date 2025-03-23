local telescope_ui = require("switchscheme.telescope_ui")

local function register()
	vim.api.nvim_create_user_command("SwitchColorscheme", telescope_ui.colorscheme_picker, {})
end

return {
	register = register,
}
