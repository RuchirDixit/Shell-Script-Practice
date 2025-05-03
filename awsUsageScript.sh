#! /bin/bash

echo "Executing script..."


#############################

# Bash script to report AWS resource usage

# Author : Ruchir Dixit

#######################################

# Resources we will be tracking:
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# set -x  #Enable Debug

# List S3 buckets
echo "Print List of AWS S3 buckets :"
aws s3 ls --region us-west-1


# List EC2 instances

echo "Print List of AWS EC2 instances :"
aws ec2 describe-instances --region us-west-1

echo "Print only instance ids of EC2 instances :"
aws ec2 --region us-west-1 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List AWS Lambda functions

echo "Print List of AWS Lambda functions :"
aws lambda list-functions --region us-west-1

# List IAM Users

echo "Print List of AWS IAM Users :"
aws iam list-users



###########################################

# In Order to run this job using cronjob (Everyday at 8 PM) execute below commands:

# crontab -e

# 0 20 *** /drives/d/Personal Projects/ShellScripts/Shell-Script-Practice/awsUsageScript.sh

# Save it

################################################
