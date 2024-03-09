local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Bold"})
config.font_size = 16

config.window_decorations = "RESIZE"

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#131a21"
-- custom.tab_bar.background = "#1E1D2D"
-- custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
-- custom.tab_bar.new_tab.bg_color = "#1E1D2D"

config.color_schemes = {
	["Catppuccin Mocha"] = custom,
}

config.color_scheme = "Catppuccin Mocha"

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 70

config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

config.enable_scroll_bar = false

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "JetBrainsMono Nerd Font Mono", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 12.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#10171e",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#d0a9e5",

		active_tab = {
			bg_color = "#9fe8c3",
			fg_color = "#10171e",
		},
		inactive_tab = {
			bg_color = "#10171e",
			fg_color = "#D9E0EE",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},
	},
}

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- config.default_prog = { "/bin/zsh" }
config.default_prog = { "/bin/zsh", "-c", "tmux a || tmux" }


return config
