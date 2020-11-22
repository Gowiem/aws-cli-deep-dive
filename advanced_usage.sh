#!/usr/bin/env zsh

source $(pwd)/lib/demo-magic.sh

printf "\n\n=== AWS_PROFILE Demo ===\n"

pe "aws s3 ls /"

pe "aws --profile=kenobi s3 ls /"

pe "export AWS_PROFILE=kenobi"

pe "aws s3 ls /"

printf "\n\n=== Debug Demo ===\n"

pe "aws eks list-nodegroups --cluster-name rebel-endor-allies"

pe "aws --debug eks list-nodegroups --cluster-name rebel-endor-allies"

printf "\n\n=== Output Formats Demo ===\n"

pe "aws --profile=kenobi --output=json sts get-caller-identity"

pe "aws --profile=kenobi --output=yaml sts get-caller-identity"

pe "aws --profile=kenobi --output=text sts get-caller-identity"

pe "aws --profile=kenobi --output=table sts get-caller-identity"

printf "\n\n=== CLI Auto-Prompt ===\n"

pe "aws ec2 run-instances help"

pe "aws ec2 run-instances --cli-auto-prompt"
