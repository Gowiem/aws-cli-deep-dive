# AWS CLI Deep Dive ([Link to Slides](https://slides.com/gowiem/awscli-deepdive))

This repo is an accompaniment to a talk I'm giving/gave on December 2nd, 2020. It includes the demo-magic command scripts I ran, links to tools I discussed, and some of the shell tips + tricks that I've shared through out the talk.

Check out `aws_helpers.sh` for some of my personal dotfile AWS helpers.

## Talk Abstract

Come join us to take a deeper look at the AWS CLI and how you can optimize your workflow when working with this powerful tool. We won’t touch on specific AWS services or commands, but rather take a closer view into specific areas like configuration, authentication, essential supplementary tools, and some crafty shell-fu. The result will be you walking away with enhanced productivity when interacting with AWS from the command line!

## Tooling (Links)

1. [aws-cli v2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
1. [aws-vault](https://github.com/99designs/aws-vault)
   - Alternative: [saml2aws](https://github.com/Versent/saml2aws)
1. [amazon-ecr-credential-helper](https://github.com/awslabs/amazon-ecr-credential-helper)
1. [jq](https://stedolan.github.io/jq/)
    - Also, be sure to check out [jqplay.org](https://jqplay.org/) for quick jq pattern development.
1. [gossm](https://github.com/gjbae1212/gossm)
   - Alternative: [aws-gate](https://aws-gate.readthedocs.io/en/latest/)
   - Alternative: [sigil](https://github.com/danmx/sigil)
