#!/usr/bin/env bash

set -e

DEPLOYMENT_ENV=$1

if [[ "$DEPLOYMENT_ENV" == "" ]]; then
    echo "INFO: No DEPLOYMENT_ENV provided."
    exit 0
fi


source deploy/variables/${DEPLOYMENT_ENV}.properties

## Executing Terraform

if [[ "$DEPLOYMENT_ENV" == "local" ]]; then
    sh deploy/scripts/terminate_local.sh ${TF_PATH} $AWS_REGIONS
elif [[ "$DEPLOYMENT_ENV" == "prod" ]]; then
    sh deploy/scripts/terminate_prod.sh ${TF_PATH} $AWS_REGIONS
fi