lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gti",
      node_incremental = "gtn",
      node_decremental = "gsn",
      scope_incremental = "gts",
      scope_incremental = "gss",
    },
  },
}
EOF

