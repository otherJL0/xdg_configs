pkgs=(
pyright
@angular/language-server
vscode-langservers-extracted
dockerfile-language-server-nodejs
elm
elm-test
elm-format
@elm-tooling/elm-language-server
typescript
typescript-language-server
vim-language-server
vls
)
for pkg in ${pkgs[@]}; do
    sudo npm install -g ${pkg}
done

yarn global add yaml-language-server
yarn global add ansible-language-server
