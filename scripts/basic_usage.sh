#!/usr/bin/env bash

. $(pwd)/lib/demo-magic.sh

pe "aws --profile=skywalker sts get-caller-identity"

pe "aws --profile=kenobi ec2 describe-instances"

pe "aws --profile=kenobi --region=us-west-2 ec2 describe-instances"

pe "aws --profile=kenobi --region=us-west-2 --output=json ec2 describe-instances"
