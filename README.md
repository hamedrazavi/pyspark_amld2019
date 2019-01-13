# PySpark Quick Start

## Installation

First make sure you have JDK8+ installed. You can download JDK from [oracle](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). Currently (January 2019) Spark runs on Java 8+, Python 3.4+. 

1. With `anaconda` :

   `conda install -yn <env_name> -c conda-forge pyspark`

   where `<env_name>` is the name of your conda environment. 

2. Next download spark from [spark website](https://spark.apache.org/downloads.html). Currently (January 2019) the latest version is `spark-2.4.0-bin-hadoop2.7`. Unzip the downloaded file and place it in `/opt/spark-2.4.0-bin-hadoop2.7`. 

3. Set the environment variables in your `.bash_profile.sh` or `.bashrc` depending on your system:

   `export SPARK_HOME=/opt/spark-2.4.0-bin-hadoop2.7`

   `export PATH=$SPARK_HOME:$PATH`

3. Then update the paths env_var_setting.sh accordingly, and run `source env_var_setting.sh`. This will tell Spark to use the python and jupyter lab (or notebook) of anaconda <env_name>. Note that you should update the paths in `env_var_setting.sh` based on your own system. Here are sample paths in this `env_var_setting.sh`. 

   `export PYSPARK_PYTHON=/anaconda3/envs/envPy36/bin/python`

   `export PYSPARK_DRIVER_PYTHON=/anaconda3/envs/envPy36/bin/jupyter`

   `export PYSPARK_DRIVER_PYTHON_OPTS='lab'`

   The name of the environment in this example is `envPy36`. With the second and third exports the jupyter lab is triggered on running the command `pyspark`.



## Quick start

From the terminal type:

`conda activate <env_name>`

Then:

`pyspark`

This will open a jupyter lab (or notebook) where you can use Spark. See `main.ipynb` as an example. 