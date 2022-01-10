set pkgs black cmake-language-server flake8 httpie interrogate isort litecli mycli mypy tox

for pkg in $pkgs
    pipx install $pkg
end
