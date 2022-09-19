abbr -a venv py -m venv .venv
abbr -a activate . ./.venv/bin/activate.fish

# Poetry environment variables
set -gx POETRY_EXPERIMENTAL_NEW_INSTALLER true
set -gx POETRY_INSTALLER_PARALLEL true
set -gx POETRY_VIRTUALENVS_CREATE true
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -gx POETRY_VIRTUALENVS_PATH ".venv"


# Python build flags
set PYTHON_CFLAGS -fPIC
set PYTHON_CONFIGURE_OPTS --enable-loadable-sqlite-extensions --enable-optimizations --with-lto --with-computed-gotos --enable-profiling
set PYTHON_MAKE_OPTS -j16
