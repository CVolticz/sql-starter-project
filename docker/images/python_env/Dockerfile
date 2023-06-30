# reference: https://hub.docker.com/_/ubuntu/
FROM python:3.9-slim

# meta data for container labeling
LABEL maintainer="Ken Trinh <ktrinh.particle@gmail.com>"

# env language -> standardized to utf8
# fix encoding issues
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update                                                                          \
    && apt-get install -y git                                                               \
    && export DEBIAN_FRONTEND=noninteractive                                                \
    && apt-get update -y                                                                    \
    && apt-get -y install tmux                                                              \
    && apt-get install software-properties-common -y                                        \
############
            build-essential                                                                 \
            curl wget                                                                       \
            libssl-dev                                                                      \
            libffi-dev                                                                      \
            libkrb5-dev                                                                     \
            liblzma-dev                                                                     \
            jq                                                                              \
            vim                                                                             \
            unixodbc-dev
############

#install python 3 in the image
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip

# install python specific packages
COPY requirements.txt .
RUN pip3 install --user -r requirements.txt

# making stdout unbuffered (any non empty string works)
ENV PYTHONUNBUFFERED="sqlproject"

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

# setup env variable fro jupyter notebook
ENV jupyter="/root/.local/bin/jupyter-notebook"

# CMD to execute when the container is launch
# RUN cd workspace
CMD ["/root/.local/bin/jupyter-notebook", "--allow-root", "--ip=0.0.0.0", "--port=8080"]

# run docker container interactively
# docker container run -it --rm -v ${pwd}/<src>:/<src> --entrypoint=/bin/bash -p 8080:8080 <image_name>
# run jupyter notebook interactively
# /root/.local/bin/jupyter-notebook --allow-root --ip=0.0.0.0 --port=8080
