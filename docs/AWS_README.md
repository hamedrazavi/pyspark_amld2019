# Running PySpark on a Jupyter notebook on Amazon EMR

## Setting up an EMR cluster

1. **Make an AWS account**: head to Amazon [AWS](https://aws.amazon.com/) and make an account if you don't already have one
2. In the AWS Management Console type in **S3** click on the first search result to head to the Amazon s3 buckets page. 
3. Create a new bucket: name it as you wish e.g. pyspark_amld2019_bucket
4. Upload the shell script [emr_configs.sh](../emr_bootstrap/emr_configs.sh) in the  `emr_bootstrap` folder to this bucket
5. If you don't have an EC2 key-pair already stored on your pc, then [create one](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair) and save this key-pair on your system (e.g., at `~/<your_aws_key.pem>`). **Note: for security reasons you need to run this command `chmod 400 ~/<your_aws_key.pem>`**. This command makes key-pair read-only. 
6. On the [amazon EC2 console](<https://console.aws.amazon.com/ec2/>), in the navigation pane, under Network and Security, click on **Security Groups**. On the new window click on **create security group**. Name it what you want (e.g., call it allow_ssh) add a short description. Then on the security group page select this security group (i.e., allow_ssh).  On the Actions drop-down menu edit in-bound rules. You already see a default rule. On the **Type** tab select SSH. On the **Source** tab select My IP (if you have a dynamic IP address then you could select from anywhere). Save rules.
7. Now head back to the AWS Management Console and type in **EMR**. Click on the first search result to head to Amazon Elastic Map Reduce (EMR) aka Managed Hadoop Framework
8. Click on **create cluster** 
9. Click on **Go to advanced options**
10. Select the latest version of emr from the drop-down menu (e.g., emr-5.20.0) and check off Hadoop and Spark in the check-list, then click next. 
11. Select the number/type of cores you would like to have access too. Clearly the more cores the more expensive. If you have not used up your Amazon free tier you could access the cluster for free (at least for a few hours).  Click next. 
12. Type in a name for your cluster, e.g., pyspark_amld2019_cluster
13. On the same page click on the Bootstrap actions, then add a bootstrap action. In the drop-down menu select **custom action** then click on **configure and add**. For the script location select the `emr_configs.sh` from your s3 bucket that you made in step 3. Click next. 
14. Select an EC2 key pair from the drop-down menu (this is used to securely ssh to EMR clusters from your local pc), e.g., the one you created in step 5. 
15. On the Security Group options, select the security group that you made in step 6 (allow_ssh) for both master and core/task. 
16. Click on **create cluster**. This starts the cluster and runs the bootstrapping script `env_configs.sh`. 
17. Now you will be on the Cluster page: You see a green text saying **starting**, if everything goes well (i.e. no error occurs) this turns into **Bootstrapping** and then **Running**. At this point you can the **Master public DNS**: This is something similar to `ec2-3-122-41-171.eu-central-1.compute.amazonaws.com` depending which cluster center you selected in the registeration process. 
18. Now from terminal type in `ssh -i <your_aws_key.pem> <server_address>` where the `server_address` is similar to `hadoop@ec2-3-122-41-171.eu-central-1.compute.amazonaws.com`
19. You will see a message whether you would like to add this address to the trusted server address; you should type in **yes**. Then you will be connected to Amazon EMR master. 
20. In the bootstrap shell script the conda environment `py36` is already set (this is to make sure that you are running the same version of python on master and nodes.); type in`source activate py36`. 
21. Start jupyter notebook by typing in `pyspark` note the port number of the notebook (e.g. 8889)
22. Now the jupyter notebook with pyspark is running. In order to access to the notebook on your browser, in a new terminal window type in: `ssh -i <your_aws_key.pem> -L 8000:localhost:8889 hadoop@ec2-3-122-41-171.eu-central-1.compute.amazonaws.com`.  **Note**: Windows users need to do this with [PuTTy](https://www.putty.org/). 
23. In your browser type in `localhost:8000` (if you are running a notebook with a token you need to copy the token as well, e.g., `localhost:8000/?token=...`). The jupyter notebook running on the cluster is displayed on your browser. Now you can start using PySpark. To check if all is good, in the first cell type in `from pyspark.sql import SparkSession`  and the next line `spark = SparkSession.builder.getOrCreate()` and run the cell. This does not guarantee everything is fine. You need to run some serious spark code in order to make sure all is okay (e.g. run some of the lines of the [data_processing_end.ipynb](../src/local/data_processing_end.ipynb). 

## Storing, reading data

- The best way to acces data from your PySpark notebook is to store the data in an S3 bucket. For instance, `s3://test-bucket-for-tutorial/train.csv` can be read in PySpark as simple as: `spark.read.csv('s3://test-bucket-for-tutorial/train.csv')`. Note that this data is available automatically across all the nodes!
- When needed you can copy data from your Amazon s3 bucket to your EMR local storage by: `aws s3 cp s3://my-bucket//myfile ./myfolder-in-emr` 

- You can also copy data (e.g. `test.csv`) from your local system to EMR Hadoop storage by the following command: `cat test.csv | ssh -i <your-aws-key.pem> hadoop@ec2-18-184-114-44.eu-central-1.compute.amazonaws.com "hdfs dfs -put - data.zip"`. This will copy the file `test.csv` to the Hadoop cluster. Note that Spark has direct access to this meaning that to read this with PySpark you could simply use the following command: `spark.read.csv('test.csv')`.

- To list all files in your Hadoop cluster type in `hdfs dfs -ls`. 

