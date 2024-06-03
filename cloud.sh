#!/bin/bash

#Author: Lee
#Created: 03/06/2024

#bash based CLI to upload the file on cloud storage in my case AS

#To use:  ./cloud.sh

file_name=$1
bucket_name=$2

# In here i use variable for the file name and bucket name 


#check the file
# if there is a file which is same with file_name i show the message to ready to upload or i will exit with error messsage
if [ -f "$file_name" ]
 echo "$file_name found, ready to uploade"
else
 echo "Err: File is not exist."
exit 2
fi

#Uploading
# This process is copy the file into the my bucket and 2>&1 will copy the all the output and error
upload_output=$(aws s3 cp "$file_name" s3://"$bucket_name"/ 2>&1)
uploade_status=$?
# under here is for check message
if [ $upload_status -eq 0 ]
 echo "Upload success"
else
 echo "Upload failed: $upload_output"
 exit 3
 fi