
function __complete_tk
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /opt/homebrew/bin/tk
end
complete -f -c tk -a "(__complete_tk)"

