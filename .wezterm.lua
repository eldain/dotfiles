local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = true
config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.font = wezterm.font({ family = 'Berkeley Mono' })
config.font_size = 18

config.window_frame = {
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 18,
}

config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

return config
