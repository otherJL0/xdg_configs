curl -L https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery

sudo dnf config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

sudo dnf reposync
sudo dnf groupinstall -y --with-optional \
  "C Development Tools" \
  "D Development Tools and Libraries" \
  "Development Tools" \
  "Container Management" \
  "System Tools" \

sudo dnf install -y \
  alacritty \
  ansible \
  bat \
  below \
  bubblewrap \
  ccache \
  clang-tools-extra \
  clazy \
  cmake{,-{data,doc,fedora,filesystem,gui,rpm-macros}} \
  cscope \
  curl \
  dolphin-plugins \
  extra-cmake-modules \
  fd-find \
  fish \
  fontconfig{,-devel} \
  freetype{,-devel} \
  fzf \
  gh \
  git \
  git-delta \
  graphite2{,-devel} \
  harfbuzz{,-{icu,devel}} \
  heaptrack \
  helm \
  incron \
  inotify-tools \
  julia{,-{common,devel,doc}} \
  kate{,-plugins} \
  kcachegrind \
  kexi{,-libs} \
  kubernetes{,-{client,kubeadm}} \
  latte-dock \
  libcurl{,-devel} \
  libicu{,-{devel,doc}} \
  libpng{,-{devel,,static,tools}} \
  libstdc++{,-{devel,docs,static}} \
  libtree-sitter{,-devel} \
  lld \
  lldb \
  llvm \
  luajit{,-devel} \
  meson \
  ncurses{,-{libs,devel,static}} \
  neochat \
  ninja-build \
  openssl-{devel,static,libs} \
  osqueyr \
  plocate \
  readline{,-{devel,static}} \
  ripgrep \
  rr \
  sqlite{,-analyzer,devel,doc,libs} \
  sqlite{browser,man} \
  tmux \
  valgrind \
  watchman \
  wget \
  wl-clipboard \
  xz{,-{devel,libs,lzma-compat,static}} \
  zlib{,-{devel,static}}
