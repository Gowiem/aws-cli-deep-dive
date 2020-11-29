## Below are condensed AWS Dotfiles from https://github.com/Gowiem/DotFiles/tree/master/aws
## To include them in your shell, copy / download this file to your local system and inlcude
## it into your .bashrc or .zshrc via `source`. e.g. `source ~/.dotfiles/aws/aws_helpers.sh`

## Completion
###############

# zsh
# eval "$(aws-vault --completion-script-zsh)"

# bash
# eval "$(aws-vault --completion-script-bash)"

## Env Vars
############

export AWS_VAULT_PROMPT=osascript
export AWS_SESSION_TOKEN_TTL=8h
export AWS_ASSUME_ROLE_TTL=3h
export AWS_FEDERATION_TOKEN_TTL=8h

export AWS_SDK_LOAD_CONFIG=true

## Aliases
###########

# General AWS
alias aws_creds="edit ~/.aws/credentials"
alias aws_config="edit ~/.aws/config"
alias aws_info="aws sts get-caller-identity"

# AWS Vault
alias av='aws-vault'
alias ave='aws-vault exec'

# AWS Vault - Login / Logout
alias avl='avlogout && sleep 1 && avlogin'
alias avlogin='av login'
alias avlogout='open https://console.aws.amazon.com/console/logout!doLogout'

# AWS Profile
alias ap='aws_profile'
alias aps='aws_profile_session'
alias apclear='aws_clear_profile'
alias apc='aws_clear_profile'

## Functions
#############

# Open AWS CLI v2 Help page for the given command and subcommand.
function aws_help() {
  if [[ $2 == "" ]]; then
    open "https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/index.html"
  else
    open "https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/$2.html"
  fi
}

# Set your current shell to the given profile name.
function aws_profile() {
  # Clear existing AWS Session in case there already is one.
  aws_clear_profile

  export AWS_PROFILE=$1
}

# Exports the aws-vault values to env vars which are then sourced.
# This circumvents `credential_process`
function aws_profile_session() {
  # Clear existing AWS Session in case there already is one.
  aws_clear_profile

  # Exec the given profile and include the new AWS Creds into the current shell session
  source <(aws-vault exec $1 -- sh -c 'export -p')

  export AWS_PROFILE=$1
}

# Clear all AWS_* environment vars from your shell.
function aws_clear_profile() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION; do
    unset ${var}
  done
}

# Debug utility to check *some* current env vars.
function aws_print_creds() {
  for var in AWS_VAULT AWS_ACCESS_KEY_ID AWS_SESSION_TOKEN
  do
    echo "$var: ${(P)var}"
  done
}

# Debug utility to check *all* current env vars.
function aws_print_all() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION
  do
    echo "$var: ${(P)var}"
  done
}