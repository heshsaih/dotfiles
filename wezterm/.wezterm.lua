local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine"
config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe -nologo" }
config.window_background_opacity = 1

config.window_decorations = "TITLE | RESIZE"
config.font = wezterm.font("JetBrains Mono", {
	weight = "Medium",
})
config.cell_width = 1
config.font_size = 20

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	position = "bottom",
	padding = {
		tabs = {
			left = 2,
			right = 2,
		},
	},
	modules = {
		workspace = {
			enabled = false,
		},
		pane = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
		cwd = {
			enabled = true,
		},
	},
})

config.keys = {
	{
		key = "T",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local cwd_uri = pane:get_current_working_dir()
			wezterm.log_info(cwd_uri)

			window:perform_action(
				wezterm.action.SpawnCommandInNewTab({
					args = { "pwsh.exe" },
				}),
				pane
			)
		end),
	},
}

return config
