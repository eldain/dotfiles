local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = true

config.font = wezterm.font({ family = 'Berkeley Mono'})
config.font_size = 16

config.window_frame = {
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 16,
}

config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_close_confirmation = 'NeverPrompt'

return config
