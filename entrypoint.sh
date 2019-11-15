#!/bin/bash

source activate project

KERAS_BACKEND=tensorflow python -c "from keras import backend"
jupyter notebook /opt/ --ip=0.0.0.0 --port=8080 --allow-root
