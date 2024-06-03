#!/bin/bash

#Author: Lee
#Created: 03/06/2024

#bash based CLI to upload the file on cloud storage in my case AS

#To use:  ./cloud.sh

file_name=$1
bucket_name=$2

#check the file
if [ -f "$file_name" ]
 echo "$file_name found, ready to uploade"
else
 echo "Err: File is not exist."
exit 2
fi

#Uploading

upload_output=$(aws s3 cp "$file_name" s3://"$bucket_name"/ 2>&1)
uploade_status=$?

if [ $upload_status -eq 0 ]
 echo "Upload success"
else
 echo "Upload failed: $upload_output"
 exit 3
 fi