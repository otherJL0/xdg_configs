
function __complete_waypoint
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /usr/bin/waypoint
end
complete -f -c waypoint -a "(__complete_waypoint)"

