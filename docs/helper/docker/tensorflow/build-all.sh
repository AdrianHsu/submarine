#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Building base images"

set -e

cd base/ubuntu-16.04

docker build . -f Dockerfile.cpu.tf_1.13.1 -t tf-1.13.1-cpu-base:0.0.1
docker build . -f Dockerfile.gpu.tf_1.13.1 -t tf-1.13.1-gpu-base:0.0.1

echo "Finished building base images"

cd ../../with-cifar10-models/ubuntu-16.04

docker build . -f Dockerfile.cpu.tf_1.13.1 -t tf-1.13.1-cpu:0.0.1
docker build . -f Dockerfile.gpu.tf_1.13.1 -t tf-1.13.1-gpu:0.0.1

cd ../../mnist
docker build . -f Dockerfile.tony.tf.mnist.tf_1.13.1 -t tony-mnist-tf-1.13.1:0.0.1