FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update && apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         libnccl2=2.2.13-1+cuda9.0 \
         libnccl-dev=2.2.13-1+cuda9.0 \
         python-qt4 \
         libjpeg-dev \
         zip \
         unzip \
         bzip2 \
         libpng-dev &&\
     rm -rf /var/lib/apt/lists/*


ENV PYTHON_VERSION=3.6
RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
    /opt/conda/bin/conda install conda-build -y

WORKDIR /notebooks

RUN git clone --single-branch --branch v0.7.1 https://github.com/fastai/fastai.git .
RUN ls && /opt/conda/bin/conda env create
RUN /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/envs/fastai/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV USER fastai

CMD source activate fastai
CMD source ~/.bashrc

RUN /opt/conda/bin/conda install --name fastai -c conda-forge jupyterlab && \
    chmod -R a+w /notebooks 

ENV PATH /opt/conda/bin:$PATH
WORKDIR /notebooks

ENV PATH /opt/conda/envs/fastai/bin:$PATH

RUN yes | /opt/conda/bin/conda install python-graphviz && \
        /opt/conda/envs/fastai/bin/pip install pyarrow==0.10 \
        pdpbox \
        plotnine \
        scikit-misc

COPY run.sh /run.sh

CMD ["/run.sh"]
