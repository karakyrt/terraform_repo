#!/bin/bash

rm -rf .terraform/terraform.tfstate
ENV="$1"
sed -i ' ' -e "s|_env_|$ENV|" backend.tf
terraform init
echo "environments is set to $ENV"

# 1. Set ENV Variables
# 2. Run setenv.sh
# 3. Run Terraform
# This how you can swich environments(dev) and you need to set up ENV Variables first and you need to understend how it works ?????