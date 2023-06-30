FROM jupyter/datascience-notebook

RUN python --version

RUN conda install --quiet --yes -c \
    conda-forge osmnx dask

# install python specific packages
COPY requirements.txt .
RUN pip3 install --user -r requirements.txt

VOLUME /workspace
WORKDIR /workspace

# CMD ['jupyter/pyspark-notebook']