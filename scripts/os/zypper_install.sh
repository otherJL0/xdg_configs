#!/bin/bash

tw_repos=(
https://cli.github.com/packages/rpm/gh-cli.repo
https://download.opensuse.org/repositories/KDE:/Applications/KDE_Frameworks5_openSUSE_Tumbleweed/KDE:Applications.repo
https://download.opensuse.org/repositories/KDE:/Extra/KDE_Frameworks5_openSUSE_Tumbleweed/KDE:Extra.repo
https://download.opensuse.org/repositories/KDE:/Frameworks5/openSUSE_Factory/KDE:Frameworks5.repo
https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/mozilla.repo
https://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/science.repo
https://download.opensuse.org/repositories/science:/machinelearning/openSUSE_Tumbleweed/science:machinelearning.repo
https://download.opensuse.org/repositories/server:/database/openSUSE_Tumbleweed/server:database.repo
https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed/shells.repo
)
for repo in "${tw_repos[@]}"; do 
  sudo zypper addrepo "$repo"
done

sudo zypper refresh
sudo zypper -v dup --allow-vendor-change

sudo zypper install -y \
  ShellCheck \
  alacritty \
  apache-arrow-devel{,-static} \
  auto{conf,make} \
  bat \
  bison \
  buildah \
  calligra{,-{devel,doc,extras-{okular,filemanagertemplates,dolphin,converter},karbon,sheets,plan,tools,words,stage}} \
  cantor \
  ccache \
  clang{,-{doc,tools,devel}} \
  clazy \
  cmake \
  cscope \
  dolphin-plugins \
  elisa \
  extra-cmake-modules{,-doc} \
  fd \
  fish \
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
  libopenssl-devel \
  libtiff-devel \
  libtool \
  lldb{,-devel} \
  llvm{,-{devel,doc,polly}} \
  make \
  meson \
  minikube \
  mlocate \
  ncurses{,-devel{,-static}} \
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
  readline{,-devel-static} \
  ripgrep \
  rocs \
  ruby3.0{,-{devel{,-extra},doc{,-ri}}} \
  sccache \
  sqlite3{,-{doc,devel}} \
  sqlitebrowser \
  starship \
  tellico \
  texlive-chktex-{bin,doc} \
  tmux \
  umbrello \
  valgrind \
  watchman \
  wl-clipboard \
  xz-static-devel \
  yakuake \
  yarn \
  zip \
  zlib-devel \
  zsh
