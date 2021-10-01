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
