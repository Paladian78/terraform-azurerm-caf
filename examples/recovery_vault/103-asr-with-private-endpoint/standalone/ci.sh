#!/bin/bash

set -e

current_folder=$(pwd)
cd standalone

terraform init

terraform apply \
  -var-file ../configuration.tfvars \
  -var-file ../private_dns.tfvars \
  -var-file ../private_endpoints.tfvars\
  -var-file ../recovery_vaults.tfvars \
  -var-file ../virtual_networks.tfvars\
  -var tags='{testing_job_id="${1}"}' \
  -var var_folder_path=${current_folder} \
  -input=false \
  -auto-approve


terraform destroy \
  -var-file ../configuration.tfvars \
  -var-file ../private_dns.tfvars \
  -var-file ../private_endpoints.tfvars\
  -var-file ../recovery_vaults.tfvars \
  -var-file ../virtual_networks.tfvars\
  -var tags='{testing_job_id="${1}"}' \
  -var tags='{testing_job_id="${1}"}' \
  -var var_folder_path=${current_folder} \
  -input=false \
  -auto-approve

