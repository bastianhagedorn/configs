#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install locate
sudo updatedb

sudo apt-get install cmake

sudo apt-get install libboost-all-dev

git clone https://b_hagedorn@bitbucket.org/cdubach/executor.git
cd executor
git checkout stencil
mkdir build
cd build

