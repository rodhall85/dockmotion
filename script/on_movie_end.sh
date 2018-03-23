#!/bin/bash

FILENAME=$1
CAMERA=$2
echo "Movie created for Camera $CAMERA at $FILENAME"

aws s3 mv $FILENAME.mp4 s3://rods-cameras/camera-$CAMERA/