local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'pwsh.exe', '-NoLogo' }

config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 3000 }

config.keys = {
  { 
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  { 
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } 
  },
}

return config
