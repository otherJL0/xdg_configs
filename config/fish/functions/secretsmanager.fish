function secretsmanager
    set -l secretname (aws secretsmanager list-secrets --query 'SecretList[*].Name' | jq '.[]' -r | gum filter)
    command aws secretsmanager get-secret-value --secret-id $secretname --query SecretString --output text | jq --arg secret $secretname '{$secret: .}'
end
