local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple:find('windows') then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 13.0

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
