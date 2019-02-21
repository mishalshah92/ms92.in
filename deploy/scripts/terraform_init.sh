#!/usr/bin/env bash

INSTALL_DIR=$1

if [ "$INSTALL_DIR" == "" ]; then
    INSTALL_DIR="$PWD"
fi

# Installing Terraform
echo "INFO: Installing terraform..."

wget -O ${INSTALL_DIR}/terraform https://nexus.sophos-tools.com/repository/build-assets/terraform_0.11.3
chmod +x ./terraform

echo "INFO: Installing terraform complete."