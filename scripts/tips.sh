#!/usr/bin/env zsh

. $(pwd)/lib/demo-magic.sh

. ~/.zshrc

printf "\n\n=== Never login to the console again ===\n"

pe "aws-vault login kenobi"

printf '\nFavorite alias:'

pei "alias avl='open https://console.aws.amazon.com/console/logout!doLogout && sleep 1 && aws-vault login'"

pe "avl finn"

printf "\n\n=== jq ===\n"

export AWS_REGION=us-west-2

pe "aws-vault exec kenobi -- aws --output=json ec2 describe-instances"

pe "aws-vault exec kenobi -- aws --output=json ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceType'"

pe "aws-vault exec kenobi -- aws --output=json ec2 describe-instances | jq -r \".Reservations[0].Instances[0].InstanceType\""

printf "\n\n=== aws-vault + AWS_PROFILE ===\n"

pe "export AWS_PROFILE=chewbacca"

pe "aws sts get-caller-identity"

pe "export AWS_PROFILE=finn"

pe "aws sts get-caller-identity"

pe "export AWS_SDK_LOAD_CONFIG=true"

printf "\n\n=== Better AWS Help ===\n"

pe "aws ec2 help"

pe "aws ec2 describe-instances help"

echo "
function aws_help() {
  if [[ $2 == '' ]]; then
    open 'https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/index.html'
  else
    open 'https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/$2.html'
  fi
}"

pe "aws_help ec2 describe-instances"
