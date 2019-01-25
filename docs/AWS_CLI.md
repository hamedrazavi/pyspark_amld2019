# AWS CLI

## Installation 

`conda install -c conda-forge awscli `

## Configuration 

`aws configure` 

```shell
AWS Access Key ID [****************X4YA]:
AWS Secret Access Key [****************upAj]:
Default region name [None]:
Default output format [None]:
```

To make Access Key ID and Secret Key, log in to your aws console. From drop-down menu under your name select `My Security Credentials`. Then `Users`. Then `Add user`. Type in a `username`. Select `Programmatic access` in access type. In the next page, `Create group`. Then search for `AmazonS3FullAccess`. Give this group a name and create the group. Select this group and go to the next page. Follow the remaining steps and then create user. Now download the csv file of the Access key ID and Secret key. Save them in a secure place. Run `aws configure` and copy paste Access Key ID and Secret Key accordingly. 

## Useful `aws cli` commands:

Copy from local to aws s3 bucket:

`aws s3 cp local_file s3://your-bucket-address` 

Recursively copy a folder

`aws s3 cp local_folder s3://your-bucket-address --recursive`

Move S3 bucket to a different location 

`aws s3 sync s3://your-bucket s3://your-new-bucket --source-region us-east-1 --region eu-central-1`

List current EC2 instances with a type (e.g., m3.large):

`aws ec2 describe-instances --filters "Name=instance-type,Values=m3.large"` 

List emr cluster with a given id:

`aws emr describe-cluster --cluster-id j-ABCDEFHGJIKMQ`



Note that you `aws cli` is by default installed on your EMR instances too. 