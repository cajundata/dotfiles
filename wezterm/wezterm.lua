local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple:find('windows') then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

-- Cajun Data brand scheme: cajundata.com tokens; ANSI accents from the
-- Tailwind 400/300 series that the brand's sky-blue accent belongs to
config.color_schemes = {
  ['Cajun Data'] = {
    foreground = '#eef1f3',
    background = '#0b0c0e',
    cursor_bg = '#38bdf8',
    cursor_fg = '#0b0c0e',
    cursor_border = '#38bdf8',
    selection_bg = '#0e3a54',
    selection_fg = 'none',
    split = '#22262b',
    ansi = { '#22262b', '#f87171', '#34d399', '#fbbf24', '#38bdf8', '#a78bfa', '#22d3ee', '#c9d3d8' },
    brights = { '#5b656c', '#fca5a5', '#6ee7b7', '#fcd34d', '#7dd3fc', '#c4b5fd', '#67e8f9', '#eef1f3' },
  },
}
config.color_scheme = 'Cajun Data'
-- config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15.0

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
