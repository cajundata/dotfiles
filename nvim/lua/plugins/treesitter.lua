-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",                -- stable API; main branch uses a different setup model
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go",
          "gomod",
          "gosum",
          "gowork",
          "python",
          "markdown",
          "markdown_inline",
          "toml",
          "yaml",
          "typescript",
          "tsx",
          "javascript",
          "css",
          "json",
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "regex",
        },
        sync_install = false,
        auto_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = false,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<C-space>",
            node_incremental  = "<C-space>",
            node_decremental  = "<bs>",
            scope_incremental = "<C-s>",
          },
        },
      })
    end,
  },
}