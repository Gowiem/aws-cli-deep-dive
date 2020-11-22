#!/usr/bin/env bash

. $(pwd)/lib/demo-magic.sh

printf "\n\n=== Never login to the console again ===\n"

pe "aws-vault login kenobi"

printf '\nFavorite alias: alias avl="open https://console.aws.amazon.com/console/logout!doLogout && sleep 1 && aws-vault login"\n'

pe "avl finn"

printf "\n\n=== jq ===\n"

export AWS_REGION=us-west-2

pe "aws --output=json ec2 describe-instances"

pe "aws --output=json ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceType'"

pe "aws --output=json ec2 describe-instances | jq -r \".Reservations[0].Instances[0].InstanceType\""

printf "\n\n=== aws-vault + AWS_PROFILE ===\n"

pe "TODO"

pe "export AWS_SDK_LOAD_CONFIG=true"

printf "\n\n=== Better AWS Help ===\n"

pe "aws ec2 help"

pe "aws ec2 describe-instances help"

pe "aws_help ec2 describe-instances"
