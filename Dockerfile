#FROM nvidia/cuda:9.0-cudnn7-runtime
FROM nvidia/cuda:10.0-cudnn7-runtime

ARG PYTHON_VERSION=3.6
ARG CONDA_VERSION=3
ARG CONDA_PY_VERSION=4.5.11

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3-pip python3-dev wget gcc g++ make cmake libglib2.0-0 libsm6  libxext6 \
    libxrender-dev\
        bzip2 libopenblas-dev pbzip2 libgl1-mesa-glx && \
            apt-get clean && \
                rm -rf /var/lib/apt/lists/*

# INSTALLATION OF CONDA
ENV PATH /opt/conda/bin:$PATH
COPY ./conda/miniconda.sh /opt/
RUN  /bin/bash /opt/miniconda.sh -b -p /opt/conda && \
     rm /opt/miniconda.sh && \
         /opt/conda/bin/conda clean -tipsy && \
             ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
                 echo “. /opt/conda/etc/profile.d/conda.sh” >> ~/.bashrc && \
                     echo “conda activate base” >> ~/.bashrc


COPY ./conda/conda_requirements.yml /opt
RUN conda env create -f /opt/conda_requirements.yml

COPY ./entrypoint.sh /opt/
COPY ./physics_sim.py /opt/
COPY ./task.py /opt/
COPY ./agents /opt/agents/
COPY ./Quadcopter_Project.ipynb /opt/

RUN chmod +x /opt/entrypoint.sh

EXPOSE 8080

ENTRYPOINT '/opt/entrypoint.sh'
