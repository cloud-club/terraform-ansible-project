#!/bin/bash
set -ex
AWS_REGION="ap-northeast-2"

S3_BUCKET=`aws s3 ls --region $AWS_REGION |grep terraform-state |tail -n1 |cut -d ' ' -f3`
sed -i 's/terraform-state-backend/'${S3_BUCKET}'/' backend.tf
sed -i 's/#//g' backend.tf
aws s3 cp s3://${S3_BUCKET}/ami.tf ami.tf --region $AWS_REGION
terraform init
terraform apply -auto-approve