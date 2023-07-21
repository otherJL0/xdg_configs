function kexec
    if test (count $argv) -eq 0
        command kubectl exec -it (kubectl get pods -o=custom-columns=:.metadata.name --no-headers | gum filter) -- /bin/bash
    else
        command kubectl exec -it (kubectl get pods -o=custom-columns=:.metadata.name --no-headers -l app=$argv) -- /bin/bash
    end
end
