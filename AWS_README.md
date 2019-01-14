# Running PySpark on a Jupyter notebook on Amazon EMR

1. **Make an AWS account**: head to Amazon [AWS](https://aws.amazon.com/) and make an account if you don't already have one
2. In the AWS Management Console type in **S3** click on the first search result to head to the Amazon s3 buckets page. 
3. Create a new bucket: name it as you wish e.g. pyspark_amld2019_bucket
4. Upload the `emr_configs.sh` shell script to this bucket
5. Now head back to the AWS Management Console and type in **EMR**. Click on the first search result to head to Amazon Elastic Map Reduce (EMR) aka Managed Hadoop Framework
6. Click on **create cluster** 
7. Click on **Go to advanced options**
8. Select the latest version of emr from the drop-down menu (e.g., emr-5.20.0) and check off Hadoop and Spark in the check-list, then click next. 
9. Select the number/type of cores you would like to have access too. Clearly the more cores the more expensive. If you have not used up your Amazon free tier you could access the cluster for free (at least for a few hours).  Click next. 
10. Type in a name for your cluster, e.g., pyspark_amld2019_cluster
11. On the same page click on the Bootstrap actions, then add a bootstrap action. In the drop-down menu select **custom action** then click on **configure and add**. For the script location select the `emr_configs.sh` from your s3 bucket that you made in step 3. Click next. 
12. Select an EC2 key pair (this is used to securely ssh to EMR clusters from your local pc). If you don't have an EC2 key pair you can [create one](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair) or select to continue without an EC2 key pair. 
13. Click on the EC2 security groups, then click on **create a security group**. On the new window click on **create security group**. Name it what you want (e.g., call it allow_ssh) add a short description. Then on the security group page select this security group.  On the Actions drop-down menu edit in-bound rules. Click on **Add Rule**. On the **Source** tab select My IP. Save rules.
14. Now go back to the where you were in step 12 (i.e. Security Options page), and select the security group that you just made (I called it allow_ssh) for both master and core/task. Click on **create cluster**. This is start the cluster while running the bootstrapping script `env_configs.sh`. 
15. Now you will be on the Cluster page: You see a green text saying **starting**, if everything goes well (i.e. no error occurs) this turns into **Bootstrapping** and then **Running**. At this point you can the **Master public DNS**: This is something similar to `ec2-3-122-41-171.eu-central-1.compute.amazonaws.com` depending which cluster center you selected in the registeration process. 
16. Now from terminal type in `ssh -i <your_aws_key.pem> <server_address>` where the `server_address` is similar to `hadoop@ec2-3-122-41-171.eu-central-1.compute.amazonaws.com`
17. You will see a message whether you would like to add this address to the trusted server address; you should type in **yes**. Then you will be connected to Amazon EMR master. 
18. Set a conda environment, say `py34`, with a python version 3.4 by running the following command: `conda create -yn py34 python=3.4` (this is to make sure that you are running the same version of python on master and nodes.). Then `source activate py34`. 
19. Start jupyter notebook by typing in `pyspark` note the port number of the notebook (e.g. 8889)
20. Now the jupyter notebook with pyspark is running. In order to access to the notebook on your browser, in a new terminal window type in: `ssh -i <your_aws_key.pem> -L 8000:localhost:8889 hadoop@ec2-3-122-41-171.eu-central-1.compute.amazonaws.com`. 
21. In your browser type in localhost:8000. The jupyter notebook running on the cluster is displayed on your browser. Now you can start using PySpark. To check if all is good, in the first cell type in `from pyspark.sql import SparkSession`  and the next line `spark = SparkSession.builder.getOrCreate()` and run the cell. 
22. When needed you can copy data from your Amazon s3 bucket to your EMR local storage by: `aws cp s3://my-bucket//myfile ./myfolder-in-emr` 
23. You can also copy data from your local system to EMR Hadoop storage by the following command: `cat test.csv | ssh -i <your-aws-key.pem> hadoop@ec2-18-184-114-44.eu-central-1.compute.amazonaws.com "hadoop dfs -put - test.csv"`. This will copy the file `test.csv` to the Hadoop cluster. Note that Spark has direct access to this meaning that to read this with PySpark you could simply use the following command: `spark.read.csv('test.csv')`.
24. To list all files in your Hadoop cluster type in `hadoop dfs -ls`. 