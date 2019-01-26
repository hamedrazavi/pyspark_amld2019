# PySpark Quick Start

## Installation

First make sure you have JDK8+ installed. You can download JDK from [oracle](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). Currently (January 2019) Spark runs on Java 8+, Python 3.4+. 

With `anaconda`:

1. Create a conda environment (e.g., py36):

   `conda install -n py36 python=3.6`

2. Install `anaconda`  in your conda environment (this is a big package which already install popular data science libraries and tools such as Jupyter notebook)

   `conda install -yn p36 anaconda` 

3. Install `pyspark` in your conda environment

   `conda install -yn p36 -c conda-forge pyspark`

   where `p36` is the name of your conda environment. 

4. Next download spark from [spark website](https://spark.apache.org/downloads.html). Currently (January 2019) the latest version is `spark-2.4.0-bin-hadoop2.7`. Unzip the downloaded file and place it in `/opt/spark-2.4.0-bin-hadoop2.7`. 

5. Set the environment variables in your `.bash_profile` or `.bashrc` depending on your system:

   `export SPARK_HOME=/opt/spark-2.4.0-bin-hadoop2.7`

   `export PATH=$SPARK_HOME:$PATH`

6. Then update the paths env_var_setting.sh accordingly, and run `source env_var_setting.sh`. This will tell Spark to use the python and jupyter lab (or notebook) of anaconda <env_name>. Note that you should update the paths in `env_var_setting.sh` based on your own system. Here are sample paths in this `env_var_setting.sh`. 

   `export PYSPARK_PYTHON=/anaconda3/envs/py36/bin/python`

   `export PYSPARK_DRIVER_PYTHON=/anaconda3/envs/py36/bin/jupyter`

   `export PYSPARK_DRIVER_PYTHON_OPTS='lab'`

   The name of the environment in this example is `py36`. With the second and third exports the Jupyter lab is triggered on running the command `pyspark`.



## Quick start

From the terminal type:

`conda activate <env_name>`

where `<env_name>` is the name of your conda environment you made above (e.g., `py36`). Then:

`pyspark`

This will open a Jupyter lab (or notebook) where you can use Spark. To test that pyspark is running properly run the notebook [test_pyspark.ipynb](./src/test_pyspark.ipynb) `src` folder as an example. 