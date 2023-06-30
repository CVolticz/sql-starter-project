#!/bin/bash
########################################################

## Shell Script to cleanup the containers after done working

########################################################
cd docker/clusters/python_postgres/
sudo docker-compose down --volumes