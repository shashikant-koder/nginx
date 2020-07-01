#!/bin/bash

img1=$1
img2=$2
cul -LO https://storage.googleapis.com/container-diff/latest/container-diff-linux-amd64 && chmod +x container-diff-linux-amd64 && mkdir -p $HOME/bin && export PATH=$PATH:$HOME/bin && mv container-diff-linux-amd64 $HOME/bin/container-diff

#container-diff analyze daemon://nginx --type=history --type=size --type=rpm  --type=pip --type=apt --type=node

container-diff diff daemon://$1 daemon://$2 --type=history --type=apt --type=node