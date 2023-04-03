#!/bin/bash

#####################################################
#Author: Shouaib
#Date: 03/04/23
#Purpose: Automated report generation for resources
######################################################
#set -x

echo "All S3 buckets:" > ResourceTracker
aws s3 ls >> ResourceTracker

echo "All EC2 instances" >> ResourceTracker
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> ResourceTracker

echo "All IAM Users" >> ResourceTracker
aws iam list-users | jq '.Users[].UserName' >> ResourceTracker

echo "All lambda functions" >> ResourceTracker
aws lambda list-functions >> ResourceTracker
