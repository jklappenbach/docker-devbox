#!/bin/bash

docker run -it -h devbox -p 2222:22 --rm -v cajeta-dev:/home/julian/code linux-devbox /bin/zsh
