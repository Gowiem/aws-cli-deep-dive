#!/usr/bin/env zsh

source $(pwd)/lib/demo-magic.sh

aws-vault remove chewbacca

pe "aws-vault help"

pe "aws-vault add chewbacca"

pe "aws-vault list"

pe "aws-vault exec kenobi -- aws sts get-caller-identity"

pe "aws-vault exec kenobi -- printenv | grep AWS_ | sed 's/SECRET_ACCESS_KEY=.*/SECRET_ACCESS_KEY=***/' | sed 's/_TOKEN=.*/_TOKEN=***/'"
