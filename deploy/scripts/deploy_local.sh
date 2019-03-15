#!/usr/bin/env bash

set -e

## Setting Defaults

#### AWS Deployment Regions
DEPLOYMENT_ENV=local
echo "INFO: Current Deployment ENV is "${DEPLOYMENT_ENV}


## Reading arguments
TF_PATH=$1
AWS_REGIONS=$2


## Setting terraform PATH
if [[ "TF_PATH" == "" ]]; then
    INSTALL_DIR="$PWD"
fi

echo "INFO: Terraform PATH: "${TF_PATH}


if [[ "AWS_REGIONS" == "" ]]; then
    echo "INFO: No AWS_REGIONS provided."
    exit 0
else
    echo "INFO: AWS Regions: "${AWS_REGIONS}
fi

## Initializing Terraform
echo "INFO: Initializing Terraform..."

terraform \
    init \
        -upgrade=true \
        -get=true \
        -input=false \
        -force-copy \
        -backend=false \
        -lock=true \
        ${TF_PATH}


## Now loop through AWS regions array
for aws_region in "${AWS_REGIONS[@]}"
do

   {

      echo "INFO: Terraform Planning..."

      terraform \
           plan \
             -var-file="${TF_PATH}/variables/commons.tfvars" \
             -var-file="${TF_PATH}/variables/${DEPLOYMENT_ENV}.tfvars" \
             -var "aws_region=${aws_region}"  \
             -out plan_${aws_region} \
             -lock=true \
             ${TF_PATH}

  } && {

      echo "INFO: Terraform Executing..."

      terraform \
        apply \
          plan_${aws_region}

  }

done

echo "INFO: Infra build complete."