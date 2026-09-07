local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.color_scheme = 'Arthur (Gogh)'
config.default_prog = { "/usr/bin/zsh" }
config.window_background_opacity = 1

config.window_decorations = "NONE"
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.font = wezterm.font("JetBrainsMono", {
	weight = "Light",
	style = "Normal",
})
config.cell_width = 1
config.font_size = 14

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
			enabled = false,
		},
	},
})

config.keys = {
	{
		key = "t",
		mods = "CTRL|ALT",
		action = wezterm.action.SpawnCommandInNewTab({
			args = {
				"zsh",
				"-c",
				'cd "$HOME/personal/projects/$(fd -C ~/personal/projects --max-depth 2 --min-depth 1 -t d | fzf)"; exec zsh',
			},
		}),
	},
}

return config
