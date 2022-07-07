return {
  cmd = { 'ocamllsp' },
  filetypes = { 'ocaml', 'ocaml.menhir', 'ocaml.interface', 'ocaml.ocamllex', 'reason' },
  root_dir = require('lspconfig.util').root_pattern(
    '*.opam',
    'esy.json',
    'package.json',
    '.git',
    '.ocamlformat'
  ),
}
