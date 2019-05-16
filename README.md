# Fast.ai Adapted Docker files for Machine Learning Course


## Overview

This is a docker build file designed to prepare the enviroment for Fast.ai machine learning course **without** Nvidia drivers or GPU so you can expect fast trainings but it may be useful for learning.

This container pulls the neccesary fast.ai classes and data. This Docker file is a modified version of [this](https://github.com/Paperspace/fastai-docker/blob/master/fastai-v2/Dockerfile).

## Requirements:

[Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)

## Build

`sudo docker build -t fastaiml .`


## Run in a Docker container

`sudo docker run -i -p 8888:8888 fastaiml`

When you run your container, it will print in the console the URL from where you can access to the jupyter notebook.

You can know the jupyter notebook too, with the following command:

`jupyter notebook list`

## Pre-built runtimes

You can just run the following without having to build the entire container yourself. This will pull the container from Docker Hub.

`docker run -d -p 8888:8888 hamorillo/fast_ai_ml_course_environment`

# Download dataset

You should download the zip with the dataset from Kaggle in the folder:

**/notebooks/courses/ml1/data/bulldozers**

You can do it with a cURL in the terminal of the docker container. (Don't forget to accept the terms & conditions in Kaggle web to retrive the cURL). When you have the dataset downloaded, just unzip it in the previous folder.