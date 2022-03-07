abbr -a venv py -m venv .venv
abbr -a activate . ./.venv/bin/activate.fish

# Poetry environment variables
set -gx POETRY_EXPERIMENTAL_NEW-INSTALLER true
set -gx POETRY_INSTALLER_PARALLEL true
set -gx POETRY_VIRTUALENVS_CREATE true
set -gx POETRY_VIRTUALENVS_IN-PROJECT true
set -gx POETRY_VIRTUALENVS_PATH .venv
