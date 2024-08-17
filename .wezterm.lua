local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.font = wezterm.font({ family = 'Berkeley Mono' })
config.font_size = 18

config.window_frame = {
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 18,
}

config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

config.initial_rows = 24
config.initial_cols = 80

config.keys = {
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}


wezterm.on('update-status', function(window)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.strftime('%a, %b %-d | %H:%M') .. ' ' },
  }))
end)


return config
