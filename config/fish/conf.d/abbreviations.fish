abbr -a bru brew update
abbr -a brU brew upgrade
abbr -a pI pip install
abbr -a pym python -m
abbr -a Type type -a
abbr -a wcl wc -l
abbr -a prs gh pr status

abbr -a fdd fd --type d
abbr -a fdf fd --type f
abbr -a fdl fd --type l
abbr -a fdex fd --extension
abbr -a fdjson fd --extension json
abbr -a fdpy fd --extension py


abbr -a rgpy rg --type py

function hrg --wraps rg
    kitty +kitten hyperlinked_grep $argv
end

abbr -a kit kitty +kitten
abbr -a icat kitty +kitten icat

abbr -a sortuniq sort \| uniq -c \| sort -n

