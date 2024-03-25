function kube
    if test $argv[1] = describe
        if test $argv[2] = pod
            kubecolor describe pod (kubectl get pods -o=custom-columns=:.metadata.name --no-headers | gum filter)
            return 0
        end
    end
    if test $argv[1] = logs
        kubecolor logs (kubectl get pods -o=custom-columns=:.metadata.name --no-headers | gum filter)
        return 0
    end

    if test $argv[1] = shell
        kubecolor exec -it (kubectl get pods -o=custom-columns=:.metadata.name --no-headers | gum filter) -- /bin/bash
        return 0
    end
    if test $argv[1] = context
        kubecolor config use-context (kubectl config get-contexts -o name | gum filter --height=10)
        return 0
    end

    if test $argv[1] = secret
        set -l kubesecret (kubectl get secrets -o=custom-columns=:.metadata.name --no-headers | gum filter)
        command kubectl get secret $kubesecret -o=jsonpath='{.data}' | jq --arg secret $kubesecret '{$secret: map_values(@base64d)}'
    end
end
