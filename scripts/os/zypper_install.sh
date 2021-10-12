tw_repos=(
https://cli.github.com/packages/rpm/gh-cli.repo
https://download.opensuse.org/repositories/KDE:/Applications/KDE_Frameworks5_openSUSE_Tumbleweed/KDE:Applications.repo
https://download.opensuse.org/repositories/KDE:/Extra/KDE_Frameworks5_openSUSE_Tumbleweed/KDE:Extra.repo
https://download.opensuse.org/repositories/KDE:/Frameworks5/openSUSE_Factory/KDE:Frameworks5.repo
https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/mozilla.repo
https://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/science.repo
https://download.opensuse.org/repositories/science:/GPU:/Intel-OpenCL/openSUSE_Tumbleweed/science:GPU:Intel-OpenCL.repo
https://download.opensuse.org/repositories/science:/machinelearning/openSUSE_Tumbleweed/science:machinelearning.repo
https://download.opensuse.org/repositories/server:/database/openSUSE_Tumbleweed/server:database.repo
https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed.shells.repo
https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed/shells.repo
)
for repo in ${tw_repos[@]}; do 
  sudo zypper addrepo ${repo}
done
sudo zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA

sudo zypper refresh
sudo zypper -vy dup --allow-vendor-change

sudo zypper install -y \
  apache-arrow-devel{,-static} \
  auto{conf,make} \
  bat \
  bison \
  buildah \
  calligra{,-{devel,doc,extras-{okular,filemanagertemplates,dolphin,converter},karbon,sheets,plan,tools,words,stage}} \
  cantor \
  ccache \
  clang{,-{doc,tools.devel}} \
  clazy \
  cmake \
  cscope \
  dolphin-plugins \
  elisa \
  extra-cmake-modules{,-doc} \
  fd \
  gcc{,-c++} \
  gettext-tools \
  gh \
  giflib-devel \
  git{,-delta} \
  heaptrack{,-{devel,gui}} \
  helm \
  julia{,-{devel,doc}} \
  kcachegrind \
  kdebugsettings \
  kdiff3 \
  kexi \
  kget \
  kig \
  kirigami-{devel,gallery} \
  krita{,-devel} \
  ktimetracker \
  kubernetes1.22-{client,kube{adm,let},controller-manager,apiserver} \
  latte-dock \
  libXpm-devel libXpm-tools \
  libdbusmenu-{tools,gtk3-devel,qt5-devel} \
  libevent-devel \
  libgnutls-devel \
  libjpeg8-devel \
  libnotify-tools \
  libtiff-devel \
  libtool \
  lldb{,-devel} \
  llvm{,-{devel,doc,polly}} \
  make \
  minikube \
  mlocate \
  ncurses{,-devel} \
  neochat \
  ninja \
  nodejs-common \
  okteta{,-{data,devel,part}} \
  opam \
  openssl \
  podman \
  postgresql13{,-{devel,docs,llvmjit,plpython,server}} \
  pyenv \
  python3-{lldb,clang} \
  python39-{poetry,pipx,pip} \
  ripgrep \
  rocs \
  rr \
  ruby3.0{,-{devel{,-extra},doc{,-ri}}} \
  sccache \
  sqlite{3,browser} \
  starship \
  tellico \
  tmux \
  umbrello \
  valgrind \
  watchman \
  wl-clipboard \
  yakuake \
  yarn \
  zip \
  zlib-devel \
  zsh


# Npm and yarn
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


# Pipx installs
pipx_modules=(
black
cmake-language-server
flake8
httpie
interrogate
ipython
isort
litecli
meson
mycli
mypy
pre-commit
ptpython
tox
)
for module in ${pipx_modules[@]}; do 
  pipx install ${module}
done

# Ad-hoc installs next
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
wget -O - https://github.com/digitalocean/doctl/releases/download/v1.64.0/doctl-1.64.0-linux-amd64.tar.gz | tar xzf -&& mv doctl ~/.local/bin/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -LO https://get.golang.org/$(uname)/go_installer && chmod +x go_installer && ./go_installer && rm go_installer
curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)" && chmod +x cs && ./cs install cs && rm cs
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Coursier installs
~/.local/share/coursier/bin/cs java --jvm openjdk:1.11
~/.local/share/coursier/bin/cs install scala metals bloop scala{fix,fmt,3,doc}

# Go installs
~/.go/bin/go install golang.org/x/tools/gopls@latest
~/.go/bin/go install github.com/go-delve/delve/cmd/dlv@latest
~/.go/bin/go install github.com/vultr/vultr-cli@latest
~/.go/bin/go install github.com/mattn/efm-langserver@latest
~/.go/bin/go install github.com/digitalocean/doctl@latest


# Cargo installs
~/.cargo/bin/cargo install stylua
~/.cargo/bin/cargo install zoxide
~/.cargo/bin/cargo install mcfly
~/.cargo/bin/cargo install deno --locked

# Install rust analyzer
~/.cargo/bin/rustup +nightly component add rust-analyzer-preview

# Install nerdfonts
wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts
rm -f ~/.fonts/*indow*
rm -f ~/.fonts/*zip*
fc-cache -vf
