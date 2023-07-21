# Helper functions
function _kctl_tty
    kubectl $argv
end

function _inline_fzf
    fzf --multi --ansi -i -1 --height=50% --reverse -0 --header-lines=1 --inline-info --border $argv
end

function _inline_fzf_nh
    fzf --multi --ansi -i -1 --height=50% --reverse -0 --inline-info --border $argv
end


function _isClusterSpaceObject
    # caller is responsible for assuring non-empty "$argv[1]"
    set obj $argv[1]
    kubectl api-resources --namespaced=false \
    | awk '(apiidx){print substr($0, 0, apiidx),substr($0, kindidx) } (!apiidx){ apiidx=index($0, " APIVERSION");kindidx=index($0, " KIND")}' \
    | grep -iq "\<$obj\>"
end

abbr -a k kubecolor

abbr -a kpods kubecolor get pods
abbr -a knames kubecolor get namespaces
abbr -a kjobs kubecolor get jobs

abbr -a konfig kubecolor config
abbr -a kontext kubecolor config use-context
abbr -a kontexts kubecolor config get-contexts
abbr -a klusters kubecolor config get-clusters
abbr -a kpods kubecolor get pods
abbr -a skale kubecolor scale
abbr -a skaledown kubecolor scale --replicas=0 deploy/
abbr -a deskribe kubecolor describe
abbr -a sekrets kubecolor get secrets

abbr -a ist istioctl
abbr -a isti istioctl
abbr -a isto istioctl
abbr -a istio istioctl

function kwatchn
    set kind $argv[1]
    if test -z "$kind"
        set kind pods
    end
    kubectl get $kind | _inline_fzf | awk '{print $1}' | xargs -r watch kubectl get $kind
end

