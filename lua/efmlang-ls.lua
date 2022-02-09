require('lspconfig').efm.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },

  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      gdscript = {
        {formatCommand = "gdformat -l 80 -", formatStdin = true}
      },
    },
  },
}

