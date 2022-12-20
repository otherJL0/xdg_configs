function blab
    set --local secret "$(aws secretsmanager list-secrets | jq '.SecretList[] | .Name' -r | gum filter)"
    aws secretsmanager get-secret-value --secret-id $secret --query SecretString --output text | jq
end

function awsecret
    set --local secret "$(aws secretsmanager list-secrets | jq '.SecretList[] | .Name' -r | gum filter)"
    aws secretsmanager get-secret-value --secret-id $secret --query SecretString --output text | jq
end

function sekret
    set --local secret "$(kubectl get secrets -o custom-columns=Name:metadata.name --no-headers | gum filter)"
    kubectl get secret $secret -o jsonpath='{.data}' | jq '. | map_values(@base64d)'
end
