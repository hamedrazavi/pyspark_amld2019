# ----------------------------------------------------------------------
#  move /usr/local to /mnt/usr-moved/local; else run out of space on /
# ----------------------------------------------------------------------
sudo mkdir /mnt/usr-moved
sudo mv /usr/local /mnt/usr-moved/
sudo ln -s /mnt/usr-moved/local /usr/
sudo mv /usr/share /mnt/usr-moved/
sudo ln -s /mnt/usr-moved/share /usr/

# ----------------------------------------------------------------------
#              Install Anaconda (Python 3) & Set To Default              
# ----------------------------------------------------------------------
echo installing Anaconda...
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda
echo -e '\nexport PATH=$HOME/anaconda/bin:$PATH' >> $HOME/.bashrc 
source $HOME/.bashrc

#-----------------------------------------------------------------------
# 		Create a conda environment
#-----------------------------------------------------------------------
#echo creating conda environment...
#conda create -yn py36 python=3.6

#-----------------------------------------------------------------------
# 		Install jupyter in the conda environment
#-----------------------------------------------------------------------
#conda install -yn py36 -c anaconda jupyter


#-----------------------------------------------------------------------
# 		Set PySpark environment variables
#-----------------------------------------------------------------------
echo setting up PySpark variables
echo -e '\nexport PYSPARK_PYTHON=`which python`' >> $HOME/.bashrc 
echo -e '\nexport PYSPARK_DRIVER_PYTHON=`which jupyter`' >> $HOME/.bashrc 
echo -e '\nexport PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --port=8889"' >> $HOME/.bashrc 
source $HOME/.bashrc

