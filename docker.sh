#!/bin/bash

# reference: https://hub.docker.com/_/ruby/
# echo "==> Running docker pull"
# docker pull ruby
# docker run -it ruby

# reference: https://hub.docker.com/_/ubuntu/
# echo "==> Running docker pull"
# docker pull ubuntu
# docker run -it ubuntu

# reference: https://www.tensorflow.org/install/docker
# docker pull tensorflow/tensorflow
# docker run -it -p 8888:8888 tensorflow/tensorflow

# reference: https://quay.io/repository/azavea/raster-vision
# docker pull quay.io/azavea/raster-vision:cpu-0.8
# docker pull quay.io/azavea/raster-vision:gpu-0.8
docker run --rm -it quay.io/azavea/raster-vision:cpu-0.8 /bin/bash
