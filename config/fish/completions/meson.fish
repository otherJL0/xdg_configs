# All meson subcommands
set -l commands setup configure dist install introsect init test wrap subprojects help rewrite compile devenv

complete -c meson -f

complete -c meson -n "not __fish_seen_subcommand_from $commands" -a "status set-time set-timezone list-timezones"
