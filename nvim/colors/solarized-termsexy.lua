-- ~/.config/nvim/colors/solarized-termsexy.lua

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "solarized-termsexy"

local set = vim.api.nvim_set_hl

local c = {
  base03  = "#002b36",
  base02  = "#073642",
  base01  = "#586e75",
  base00  = "#657b83",
  base0   = "#839496",
  base1   = "#93a1a1",
  base2   = "#eee8d5",
  base3   = "#fdf6e3",

  yellow  = "#b58900",
  orange  = "#cb4b16",
  red     = "#dc322f",
  magenta = "#d33682",
  violet  = "#6c71c4",
  blue    = "#268bd2",
  cyan    = "#2aa198",
  green   = "#859900",
}

-- ============================================================
-- Core editor
-- ============================================================
set(0, "Normal",       { fg = c.base0,  bg = c.base03 })
set(0, "NormalNC",     { fg = c.base0,  bg = c.base03 })
set(0, "NormalFloat",  { fg = c.base0,  bg = c.base02 })
set(0, "FloatBorder",  { fg = c.base01, bg = c.base02 })
set(0, "WinSeparator", { fg = c.base02, bg = c.base03 })

set(0, "Cursor",       { fg = c.base03, bg = c.base0 })
set(0, "CursorLine",   { bg = c.base02 })
set(0, "CursorLineNr", { fg = c.yellow, bg = c.base02, bold = true })
set(0, "LineNr",       { fg = c.base01 })
set(0, "SignColumn",   { fg = c.base01, bg = c.base03 })

set(0, "Visual",       { bg = c.base02 })
set(0, "Search",       { fg = c.base03, bg = c.yellow })
set(0, "IncSearch",    { fg = c.base03, bg = c.orange })

-- ============================================================
-- Legacy syntax groups (still used by non-Treesitter filetypes)
-- ============================================================
set(0, "Comment",      { fg = c.base01, italic = true })
set(0, "String",       { fg = c.cyan })
set(0, "Character",    { fg = c.cyan })
set(0, "Number",       { fg = c.magenta })
set(0, "Boolean",      { fg = c.magenta })
set(0, "Float",        { fg = c.magenta })
set(0, "Identifier",   { fg = c.blue })
set(0, "Function",     { fg = c.blue })
set(0, "Statement",    { fg = c.green })
set(0, "Conditional",  { fg = c.green })
set(0, "Repeat",       { fg = c.green })
set(0, "Label",        { fg = c.green })
set(0, "Operator",     { fg = c.base0 })
set(0, "Keyword",      { fg = c.green })
set(0, "Exception",    { fg = c.orange })
set(0, "PreProc",      { fg = c.orange })
set(0, "Include",      { fg = c.orange })
set(0, "Define",       { fg = c.orange })
set(0, "Macro",        { fg = c.orange })
set(0, "Type",         { fg = c.yellow })
set(0, "StorageClass", { fg = c.yellow })
set(0, "Structure",    { fg = c.yellow })
set(0, "Typedef",      { fg = c.yellow })
set(0, "Special",      { fg = c.violet })
set(0, "Delimiter",    { fg = c.base0 })
set(0, "Todo",         { fg = c.base03, bg = c.yellow, bold = true })

-- ============================================================
-- Treesitter capture groups
-- Most link to legacy groups; specific captures get their own treatment
-- where Treesitter exposes information legacy syntax couldn't
-- ============================================================
set(0, "@comment",                { link = "Comment" })
set(0, "@comment.documentation",  { link = "Comment" })

set(0, "@keyword",                { link = "Keyword" })
set(0, "@keyword.return",         { fg = c.green, bold = true })
set(0, "@keyword.function",       { link = "Keyword" })
set(0, "@keyword.operator",       { link = "Keyword" })
set(0, "@keyword.import",         { link = "Include" })
set(0, "@keyword.exception",      { link = "Exception" })
set(0, "@keyword.conditional",    { link = "Conditional" })
set(0, "@keyword.repeat",         { link = "Repeat" })

set(0, "@function",               { link = "Function" })
set(0, "@function.call",          { fg = c.blue })
set(0, "@function.builtin",       { fg = c.blue, italic = true })
set(0, "@function.method",        { link = "Function" })
set(0, "@function.method.call",   { fg = c.blue })
set(0, "@constructor",            { fg = c.yellow })

set(0, "@type",                   { link = "Type" })
set(0, "@type.builtin",           { fg = c.yellow, italic = true })
set(0, "@type.definition",        { link = "Type" })

set(0, "@string",                 { link = "String" })
set(0, "@string.escape",          { fg = c.orange })
set(0, "@string.special",         { fg = c.violet })
set(0, "@string.regexp",          { fg = c.orange })

set(0, "@number",                 { link = "Number" })
set(0, "@boolean",                { link = "Boolean" })
set(0, "@float",                  { link = "Float" })

set(0, "@constant",               { fg = c.magenta })
set(0, "@constant.builtin",       { fg = c.magenta, italic = true })

set(0, "@variable",               { fg = c.base0 })
set(0, "@variable.parameter",     { fg = c.base0, italic = true })
set(0, "@variable.member",        { fg = c.blue })
set(0, "@variable.builtin",       { fg = c.magenta, italic = true })

set(0, "@property",               { fg = c.blue })
set(0, "@field",                  { fg = c.blue })

set(0, "@operator",               { link = "Operator" })
set(0, "@punctuation.delimiter",  { fg = c.base0 })
set(0, "@punctuation.bracket",    { fg = c.base0 })
set(0, "@punctuation.special",    { fg = c.orange })

set(0, "@tag",                    { fg = c.blue })
set(0, "@tag.attribute",          { fg = c.yellow })
set(0, "@tag.delimiter",          { fg = c.base01 })

-- Markup (markdown via Treesitter)
set(0, "@markup.heading",          { fg = c.yellow, bold = true })
set(0, "@markup.heading.1",        { fg = c.yellow, bold = true })
set(0, "@markup.heading.2",        { fg = c.orange, bold = true })
set(0, "@markup.heading.3",        { fg = c.green, bold = true })
set(0, "@markup.heading.4",        { fg = c.cyan, bold = true })
set(0, "@markup.strong",           { bold = true })
set(0, "@markup.italic",           { italic = true })
set(0, "@markup.link",             { fg = c.blue, underline = true })
set(0, "@markup.link.url",         { fg = c.blue, underline = true })
set(0, "@markup.raw",              { fg = c.cyan })
set(0, "@markup.raw.block",        { fg = c.cyan })
set(0, "@markup.list",             { fg = c.orange })
set(0, "@markup.quote",            { fg = c.base01, italic = true })

-- ============================================================
-- LSP semantic tokens (link to Treesitter; ready for when LSP arrives)
-- ============================================================
set(0, "@lsp.type.function",      { link = "@function" })
set(0, "@lsp.type.method",        { link = "@function.method" })
set(0, "@lsp.type.variable",      { link = "@variable" })
set(0, "@lsp.type.parameter",     { link = "@variable.parameter" })
set(0, "@lsp.type.property",      { link = "@property" })
set(0, "@lsp.type.namespace",     { link = "Type" })
set(0, "@lsp.type.class",         { link = "Type" })
set(0, "@lsp.type.struct",        { link = "Type" })
set(0, "@lsp.type.interface",     { link = "Type" })
set(0, "@lsp.type.enum",          { link = "Type" })
set(0, "@lsp.type.type",          { link = "Type" })
set(0, "@lsp.type.typeParameter", { link = "Type" })
set(0, "@lsp.type.keyword",       { link = "Keyword" })
set(0, "@lsp.type.string",        { link = "String" })
set(0, "@lsp.type.number",        { link = "Number" })
set(0, "@lsp.type.comment",       { link = "Comment" })

-- ============================================================
-- Legacy markdown groups (kept for non-Treesitter rendering paths)
-- ============================================================
set(0, "markdownHeadingDelimiter", { fg = c.orange, bold = true })
set(0, "markdownH1",               { fg = c.yellow, bold = true })
set(0, "markdownH2",               { fg = c.orange, bold = true })
set(0, "markdownH3",               { fg = c.green, bold = true })
set(0, "markdownCode",             { fg = c.cyan })
set(0, "markdownCodeBlock",        { fg = c.cyan })
set(0, "markdownLinkText",         { fg = c.blue, underline = true })

-- ============================================================
-- Diagnostics
-- ============================================================
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn",  { fg = c.yellow })
set(0, "DiagnosticInfo",  { fg = c.blue })
set(0, "DiagnosticHint",  { fg = c.cyan })

set(0, "DiagnosticUnderlineError", { sp = c.red, undercurl = true })
set(0, "DiagnosticUnderlineWarn",  { sp = c.yellow, undercurl = true })
set(0, "DiagnosticUnderlineInfo",  { sp = c.blue, undercurl = true })
set(0, "DiagnosticUnderlineHint",  { sp = c.cyan, undercurl = true })

-- ============================================================
-- Diff / Git
-- ============================================================
set(0, "DiffAdd",    { fg = c.green, bg = c.base02 })
set(0, "DiffChange", { fg = c.yellow, bg = c.base02 })
set(0, "DiffDelete", { fg = c.red, bg = c.base02 })
set(0, "DiffText",   { fg = c.base03, bg = c.yellow, bold = true })

-- ============================================================
-- Popup menu
-- ============================================================
set(0, "Pmenu",      { fg = c.base0,  bg = c.base02 })
set(0, "PmenuSel",   { fg = c.base03, bg = c.base1 })
set(0, "PmenuSbar",  { bg = c.base02 })
set(0, "PmenuThumb", { bg = c.base01 })

-- ============================================================
-- Messages
-- ============================================================
set(0, "ErrorMsg",   { fg = c.red })
set(0, "WarningMsg", { fg = c.yellow })
set(0, "ModeMsg",    { fg = c.green })
set(0, "MoreMsg",    { fg = c.green })

-- ============================================================
-- Misc
-- ============================================================
set(0, "Directory",  { fg = c.blue })
set(0, "MatchParen", { fg = c.base3, bg = c.base01, bold = true })

-- ============================================================
-- :terminal ANSI palette (Solarized convention)
-- Verify these match what WezTerm renders for the same ANSI slots.
-- ============================================================
vim.g.terminal_color_0  = c.base02
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.base2

vim.g.terminal_color_8  = c.base03
vim.g.terminal_color_9  = c.orange
vim.g.terminal_color_10 = c.base01
vim.g.terminal_color_11 = c.base00
vim.g.terminal_color_12 = c.base0
vim.g.terminal_color_13 = c.violet
vim.g.terminal_color_14 = c.base1
vim.g.terminal_color_15 = c.base3