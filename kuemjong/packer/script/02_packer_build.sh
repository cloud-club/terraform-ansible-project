#!/bin/bash
set -ex

AWS_REGION=$AWS_REGION

ARTIFACT=`packer build -machine-readable -var aws_access_key=$AWS_ACCESS_KEY -var aws_secret_key=$AWS_SECRET_KEY ./packer/default_ubuntu_packer_template.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'`
echo "packer output:"

#cat ./packer/default_ubuntu_packer_template.json
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`

echo "[AMI ID: ${AMI_ID}]"
echo "[Writing ami.tf and uploading it to s3]"

echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > ami.tf
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > ./terraform/dev/service/app_gateway/ami.tf
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > ./terraform/dev/service/service_1/ami.tf
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > ./terraform/dev/service/service_2/ami.tf
S3_BUCKET=`aws s3 ls --region $AWS_REGION | grep terraform-state | tail -n1 | cut -d ' ' -f3`
aws s3 cp ami.tf s3://${S3_BUCKET}/ami.tf --region $AWS_REGION
