sudo zypper addrepo http://download.opensuse.org/repositories/KDE:/Unstable:/Frameworks/openSUSE_Factory
sudo zypper addrepo http://download.opensuse.org/repositories/KDE:/Unstable:/Extra/KDE_Unstable_Frameworks_openSUSE_Factory
sudo zypper addrepo http://download.opensuse.org/repositories/KDE:/Unstable:/Qt/openSUSE_Tumbleweed/
sudo zypper addrepo http://download.opensuse.org/repositories/KDE:/Unstable:/Applications/KDE_Unstable_Frameworks_openSUSE_Factory
sudo zypper addrepo https://cli.github.com/packages/rpm/gh-cli.repo
sudo zypper addrepo https://download.opensuse.org/repositories/server:/database/openSUSE_Tumbleweed/
sudo zypper addrepo https://download.opensuse.org/repositories/server:/database/openSUSE_Tumbleweed/server:database.repo
sudo zypper addrepo https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/mozilla.repo
sudo zypper addrepo https://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/science.repo

sudo zypper refresh

sudo zypper install apache-arrow-devel{,-static} \
  auto{conf,make} \
  bison \
  buildah \
  calligra{,-{devel,doc,extras-{okular,filemanagertemplates,dolphin,converter},karbon,sheets,plan,tools,words,stage}} \
  cantor \
  clazy \
  cmake \
  curl \
  dolphin-plugins \
  elisa \
  fd \
  gcc{,-c++} \
  gettext-tools \
  gh \
  git{,-delta} \
  heaptrack{,-{devel,gui}} \
  helm \
  hg \
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
  libevent-devel \
  libtool \
  lldb12{,-devel} \
  llvm12{,-{devel,doc,polly}} \
  man \
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
  python39-{poetry,pipx,pip} \
  ripgrep \
  rocs \
  ruby3.0{,-{devel{,-extra},doc{,-ri}}} \
  sqlite{3,browser} \
  tellico \
  tmux \
  umbrello \
  valgrind \
  wget \
  yakuake \
  yarn \
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
flake8
isort
mypy
mycli
httpie
cmake-language-server
interrogate
ipython
ptpython
tox
pre-commit
meson
litecli
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

# Cargo installs
~/.cargo/bin/cargo install stylua
~/.cargo/bin/cargo install zoxide
~/.cargo/bin/cargo install mcfly
~/.cargo/bin/cargo install starship
~/.cargo/bin/cargo install deno --locked
