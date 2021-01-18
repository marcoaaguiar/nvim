lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
    disable = {'bash'} -- please disable bash until I figure #1 out
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

