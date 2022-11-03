#!/usr/bin/env bash

docker build . -t jupyter --platform linux/x86_64
docker run -v "$PWD"/workspace:/workspace \
	-p 8888:8888 \
	--name jupyter \
	jupyter
