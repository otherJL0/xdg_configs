local neogen = require('neogen')

neogen.setup({
  enabled = true,
  snippet_engine = 'luasnip',
  languages = {
    lua = {
      template = {
        annotation_conventions = 'emmylua',
      },
    },
    typescript = {
      template = {
        annotation_conventions = 'tsdoc',
      },
    },
    typescriptreact = {
      template = {
        annotation_conventions = 'tsdoc',
      },
    },
  },
})
