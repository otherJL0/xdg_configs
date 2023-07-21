function rg
    if test (count $argv) -eq 0
        set RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case"
        set INITIAL_QUERY $argv
        echo | fzf --ansi --disabled --query "$INITIAL_QUERY" \
            --bind "start:reload:$RG_PREFIX {q}" \
            --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
            --delimiter : \
            --preview 'bat --style=numbers --color=always {1} --highlight-line {2}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
            --bind 'enter:become(nvim {1} +{2})'
    else
        command rg $argv
    end
end
