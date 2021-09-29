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
  kdevelop5{,-plugin-{python3,ruby}} \
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
  make \
  massif-visualizer5 \
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
  yakuake \
  yarn \
  zlib-devel \
  zsh

# Ad-hoc installs next
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
wget https://github.com/digitalocean/doctl/releases/download/v1.64.0/doctl-1.64.0-linux-amd64.tar.gz
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -LO https://get.golang.org/$(uname)/go_installer && chmod +x go_installer && ./go_installer && rm go_installer
curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)" && chmod +x cs && ./cs install cs && rm cs
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
