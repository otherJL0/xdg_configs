function klogs
    if test (count $argv) -eq 0
        command kubectl logs (kubectl get pods -o=custom-columns=:.metadata.name --no-headers | gum filter)
    else
        command kubectl logs (kubectl get pods -o=custom-columns=:.metadata.name --no-headers -l app=$argv)
    end
end
