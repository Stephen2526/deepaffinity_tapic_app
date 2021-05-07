FROM continuumio/miniconda3:latest
##FROM dash00/tensorflow-python3-jupyter
 
WORKDIR /deepaffinity

RUN apt-get update && apt-get install -y \
    python3-setuptools \
    && rm -rf /var/lib/apt/lists/*

##RUN pip install --upgrade pip
##RUN pip3 install tflearn
##RUN pip3 install h5py
##RUN pip3 install numpy
##RUN pip3 install scipy
##RUN pip3 install statsmodels

##RUN wget "http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.0.3.11-1+cuda9.0_amd64.deb"
##RUN dpkg -i libcudnn7_7.0.3.11-1+cuda9.0_amd64.deb

# Create the environment:
COPY environment.yml .
RUN conda config --add channels conda-forge \
    && conda env create -n deepAff -f environment.yml \
    && rm -rf /opt/conda/pkgs/*

# activate the environment
ENV PATH /opt/conda/envs/deepAff/bin:$PATH
##RUN which conda
##RUN which python
##RUN python -c "import tensorflow"

ADD joint-Model_predict.py inputs_proc.py run_job.sh uniprot.human.scratch_outputs.w_sps.tab_corrected ./
ADD pretrained_checkpoints pretrained_checkpoints/
ADD data data/
RUN chmod a+x run_job.sh
RUN chmod -R go=u /deepaffinity

##CMD [ "python", "test_docker/test_docker.py" ]
