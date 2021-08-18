#!/bin/bash

# Link all home config files to home directory
for home_config in $(ls -A home)
do
  ln -s "$(pwd)/${xdg_dir}" "${HOME}/.${home_config}"
done

# Link all config files to xdg config directory
for xdg_dir in $(ls -d config/*)
do
  ln -s "$(pwd)/${xdg_dir}" "${HOME}/.${xdg_dir}"
done
