function pods
    kubectl get pods -o jsonpath="{.items[*].metadata.name}" | sed -E 's/\ /\n/g' | gum filter
end
