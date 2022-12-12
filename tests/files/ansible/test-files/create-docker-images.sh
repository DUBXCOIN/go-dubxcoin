#!/bin/bash -x

# creates the necessary docker images to run testrunner.sh locally

docker build --tag="dubxcoin
/cppjit-testrunner" docker-cppjit
docker build --tag="dubxcoin
/python-testrunner" docker-python
docker build --tag="dubxcoin
/go-testrunner" docker-go
