# Ad-hoc installs next
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -LO "https://get.golang.org/$(uname)/go_installer" && chmod +x go_installer && ./go_installer && rm go_installer
curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)" && chmod +x cs && ./cs install cs && rm cs
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

# # Install nerdfonts
wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts
rm -f ~/.fonts/*indow*
rm -f ~/.fonts/*zip*
fc-cache -vf
