#!/bin/bash

# Npm and yarn
pkgs=(
@angular/language-server
@elm-tooling/elm-language-server
bash-language-server
dockerfile-language-server-nodejs
elm
elm-format
elm-test
pyright
typescript
typescript-language-server
vim-language-server
vls
vscode-langservers-extracted
)
for pkg in "${pkgs[@]}"; do
    npm install -g "$pkg"
done

# yarn global add yaml-language-server
# yarn global add ansible-language-server


# # Pipx installs
# pipx_modules=(
# black
# cmake-language-server
# flake8
# httpie
# interrogate
# ipython
# isort
# litecli
# meson
# mycli
# mypy
# pre-commit
# ptpython
# tox
# )
# for module in "${pipx_modules[@]}"; do 
#   pipx install "$module"
# done

# # Ad-hoc installs next
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# curl -LO "https://get.golang.org/$(uname)/go_installer" && chmod +x go_installer && ./go_installer && rm go_installer
# curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)" && chmod +x cs && ./cs install cs && rm cs
# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# # Coursier installs
cs java --jvm openjdk:1.11
cs install scala metals bloop scala{fix,fmt,3,doc}

# # Go installs
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/digitalocean/doctl@latest
go install golang.org/dl/gotip@latest
gotip download


# # Cargo installs
cargo install stylua

# # Install rust analyzer
rustup +nightly component add rust-analyzer-preview

# # Install nerdfonts
# wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
# unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts
# rm -f ~/.fonts/*indow*
# rm -f ~/.fonts/*zip*
# fc-cache -vf
