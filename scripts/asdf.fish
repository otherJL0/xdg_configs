set asdf_pkgs deno meson idris2 crystal zig esy chezscheme racket opam

for pkg in $asdf_pkgs
    asdf plugin add $pkg
    asdf install $pkg latest
    asdf global $pkg latest
end
