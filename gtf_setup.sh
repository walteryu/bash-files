#!/bin/bash

# Clone tensorflow/model repo into colab root dir, /content:
echo '===> git clone tensorflow/models'
git clone https://github.com/tensorflow/models.git
echo ''

echo '===> pip install protobuf'
# Mac installation:
# sudo port install protobuf-cpp
# Ubuntu installation:
!apt-get install -qq protobuf-compiler python-tk
echo ''

echo '===> pip install protobuf'
pip install -q Cython contextlib2 pillow lxml matplotlib PyDrive
pip install -q pycocotools
echo ''

# Config protoc, slim and builder script:
echo '===> Config protobuf'
cd ~/src/gtf/models/research/object_detection/protos
protoc ./*.proto --python_out=.
echo ''
# protoc ~/src/gtf/models/research/object_detection/protos/*.proto --python_out=.

# Run within python shell:
# python
# import os
# os.environ['PYTHONPATH'] += ':/content/models/research/:/content/models/research/slim/'

# Test installation:
python object_detection/builders/model_builder_test.py
