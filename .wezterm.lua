-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font_with_fallback {
  {family = 'Hack Nerd Font',  stretch = 'Expanded'},
--  'Droid Sans Mono',
}
config.adjust_window_size_when_changing_font_size = false

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
config.color_scheme = 'Dark Ocean (terminal.sexy)'
config.color_scheme = 'Dark Violet (base16)'
config.color_scheme = 'Misterioso (Gogh)'
config.color_scheme = 'Navy and Ivory (terminal.sexy)'
config.color_scheme = 'Palenight (Gogh)'
config.color_scheme = 'Nova (base16)'
config.color_scheme = 'Palenight (Gogh)'
config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
