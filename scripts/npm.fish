npm install -g yarn
yarn global add yaml-language-server

# Npm 
set pkgs @angular/language-server @elm-tooling/elm-language-server bash-language-server dockerfile-language-server-nodejs elm elm-format elm-test pyright typescript typescript-language-server vim-language-server vls vscode-langservers-extracted tree-sitter-cli

for pkg in $pkgs
    npm install -g $pkg
end
