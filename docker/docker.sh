#!/bin/bash

docker run -ti \
	--name $1 \
	-v $2:/data \
	dk0dvi
	
