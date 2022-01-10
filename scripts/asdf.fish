set asdf_pkgs deno crystal zig esy chezscheme racket opam ruby

for pkg in $asdf_pkgs
    asdf plugin add $pkg
    asdf install $pkg latest
    asdf global $pkg latest
end

# Node
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts


# Python
asdf plugin add python
set pyversions 3.7.12 3.8.12 3.9.9 3.10.1
for ver in $pyversions
    asdf install python $ver
end
asdf global python $pyversions
