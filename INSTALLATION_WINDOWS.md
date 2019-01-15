# PySpark Installation (Windows)

1. Download and Install [Anaconda for windows](https://www.anaconda.com/download/#windows)

2. To be able to use conda commands in terminal make sure you add the anaconda to your PATH variable. If "C:\Anaconda3" is where anaconda is installed then you need to run the following command in the terminal, close and open the terminal again:

   `setx PATH "%PATH%;C:\Anaconda3;C:\Anaconda3\Scripts"`

   You could as well just use the Anaconda Navigator (GUI) which is as easy to use. 

3. If you are a command line user check if `conda` command is working by typing `conda` in a terminal. 

4. Create a new conda environment, let's call it `py36` by running the following command:

   `conda create -n py36 python=3.6`

   You could instead create this from the anaconda navigator. 

5. To activate the conda environment in the terminal type in `activate py36` 

6. Make sure you have JDK 8 or later (Java Development Kit) installed

7. Download pre-built [Spark and Hadoop](https://spark.apache.org/downloads.html) and extract it, rename it to `spark`. Make a new directory, e.g. `C:\Users\opt\` and copy the download `spark` folder to this folder. Your spark home will then be `C:\Users\opt\spark`. 

8. Set your `SPARK_HOME` variable to `C:\Users\opt\spark` by the following command:

   `setx SPARK_HOME C:\Users\opt\spark`. As usual you need to close and open the terminal for this setting to take effect. 

9.  To install PySpark in the terminal type in `conda install -yn py36 -c conda-forge pyspark`. 

10. Now to test if pyspark was installed successfully type `activate py36`  and then type in `pyspark`. This should start pyspark. 

11. Install jupyter in your conda environment by the following command: `conda install -yn py36 -c anaconda jupyter` 

12. To run pyspark on jupyter, you need to set the variables PYSPARK_DRIVER_PYTHON and PYSPARK_DRIVER_PYTHON_OPTS. Make sure `py36` is active, if not type in `activate py36`. Then type in `where jupyter` and note the path. I assume that this path is `C:\Users\Anaconda3\envs\py36\Scripts\jupyter`. Then run the following commands in a terminal:

    `setx PYSPARK_PYTHON_DRIVER_PYTHON C:\Users\Anaconda3\envs\py36\Scripts\jupyter`

    `setx PYSPARK_PYTHON_DRIVER_OPTS notebook`

    Close and open a new terminal. 

13. In the new terminal type in `activate py36`. Then type in `pyspark`. This should start a jupyter notebook running pyspark.

14. To test the installation in the first cell of the notebook type in: 

    ```python
    from pyspark.sql import SparkSession
    spark = SparkSession.builder.getOrCreate()
    ```

    This should run without errors. 

