# PySpark Workshop

This repository includes the materials for the **PySpark** workshop in [AMLD2019](https://www.appliedmldays.org/). 

## Part 1: PySpark for Big Data Processing

### 1.1 Installation:

#### 1.1.1 Method 1: Running PySpark locally (e.g. on your laptop)

##### Mac OS or Linux:

See [INSTALLATION_UNIX.md](./docs/INSTALLATION_UNIX.md) in the `docs` folder. 

#####  Windows

See [INSTALLATION_WINDOWS.md](./docs/INSTALLATION_WINDOWS.md) in the `docs` folder. 

#### 1.1.2 Method 2: Running PySpark on Google Colab

See [GOOGLECOLAB_README.md](./docs/GOOGLECOLAB_README.md) in the `docs` folder.  



### 1.2 Agenda:

#### 1.2.1 Data processing in PySpark

If you run PySpark on your laptop then start with the notebook [data_processing_start.ipynb](./src/local/data_processing_start.ipynb) in the `src/local` folder. The completed notebook [data_processing_end.ipynb](./src/local/data_processing_end.ipynb) is in the same folder. It is highly recommended that you always start with the empty notebooks (`_start.ipynb`) and try to avoid copy-pasting the cells of the completed notebook. It is a good practice to start writing the code from scratch!

If you run PySpark on Google Colab then start with the notebook [data_processing_gc_start.ipynb](./src/google_colab/data_processing_gc_start.ipynb) in the `src/google_colab` folder. The completed notebook can be found in [data_processing_gc_end.ipynb](./src/google_colab/data_processing_gc_end.ipynb) is in the same folder.

#### 1.2.2 Machine learning in PySpark (MLlib)

If you run PySpark on your laptop then start with the notebook [spark_mllib_start.ipynb](./src/local/spark_mllib_start.ipynb) in the `src/local` folder. The completed notebook [spark_mllib_end.ipynb](./src/local/spark_mllib_end.ipynb) is in the same folder.  

If you run PySpark on Google Colab then start with the notebook [spark_mllib_gc_start.ipynb](./src/google_colab/spark_mllib_gc_start.ipynb) in the `src/google_colab` folder. The completed notebook [spark_mllib_gc_end.ipynb](./src/google_colab/spark_mllib_gc_end.ipynb) is in the same folder. 



## Part 2: Running PySpark in Jupyter Notebook on Amazon Clusters

See [AWS_README.md](./docs/AWS_README.md) in the `docs` folder. 
