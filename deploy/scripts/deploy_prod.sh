#!/usr/bin/env bash

set -e

## AWS Deployment Regions
DEPLOYMENT_ENV=prod
echo "INFO: Current Deployment ENV is "${DEPLOYMENT_ENV}


## Setting terraform PATH
TF_PATH=$1

if [ "TF_PATH" == "" ]; then
    INSTALL_DIR="$PWD"
fi

echo "INFO: Terraform PATH: "${TF_PATH}


## Installing Terraform
sh scripts/terraform_install.sh ${TF_PATH}


## Initializing Terraform
echo "INFO: Initializing Terraform..."

./terraform \
      init \
        -upgrade=true \
        -get=true \
        -input=false \
        -force-copy \
        -backend=true \
        -backend-config "bucket=${TF_STATE_S3_BUCKET}" \
        -backend-config "key=terraform/emailvpc-toc.tfstate" \
        -backend-config "region=${TF_STATE_S3_BUCKET_REGION}" \
        -backend-config "dynamodb_table=${TF_STATE_S3_DYNAMODB_TABLE}" \
        -lock=true \
        ${TF_PATH}


## Now loop through AWS regions array
for aws_region in "${AWS_REGIONS[@]}"
do


  {
      terraformWorkspace=${SERVICE_NAME}-${aws_region}-workspace
      echo "INFO: Working for "${terraformWorkspace}

      {
         ./terraform workspace new ${terraformWorkspace}
         echo "INFO: New ${terraformWorkspace} added."

      } || {
        echo "INFO: ${terraformWorkspace} already exists!"
      }

      ./terraform workspace select ${terraformWorkspace}

 } && {

      echo "INFO: Terraform Planning..."

      ./terraform \
           plan \
             -var-file="deploy/variables/${DEPLOYMENT_ENV}.tfvars" \
             -var "aws_region=${aws_region}"  \
             -out plan_${aws_region} \
             -lock=true



 } && {

      echo "INFO: Terraform Executing..."

      ./terraform \
        apply \
          plan_${aws_region}

 }


done

echo "INFO: Infra build complete."