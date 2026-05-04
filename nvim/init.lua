-- ~/.config/nvim/init.lua

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")              -- bootstraps lazy.nvim and loads plugins

vim.cmd("colorscheme solarized-termsexy")