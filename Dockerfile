# jupyter notebook image
FROM centos
MAINTAINER allocator

# version control
ENV DL_BASE_VERSION_CTL 5/12/2018 11:10:00

# set env
ENV ANACONDA_HOME /usr/local/anaconda3

# install basic software vim
RUN yum install -y vim

# install anaconda3 py3.6.x
RUN yum install -y wget
RUN yum install -y bzip2
RUN mkdir -p /home/download
RUN cd /home/download
RUN wget https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh
RUN chmod 755 ./Anaconda3-5.2.0-Linux-x86_64.sh
RUN ./Anaconda3-5.2.0-Linux-x86_64.sh -b -p /usr/local/anaconda3
RUN rm -rf /home/download/*

# set system env
ENV PATH $ANACONDA_HOME/bin:$PATH

# create link
RUN ln -s $ANACONDA_HOME/bin/pip /usr/bin/pip3

# install tensorflow with cpu
RUN pip3 install --upgrade --ignore-installed tensorflow

# install keras 
RUN conda install -y keras

# start the jupyter-notebook
ENTRYPOINT ["/usr/local/anaconda3/bin/jupyter-notebook"]

# open the default jupyter listen port
EXPOSE 8888
