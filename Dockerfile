FROM ubuntu:24.04

LABEL maintainer="benjaminjeliot@gmail.com"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    gfortran \
    make \
    wget \
    cmake \
    googletest \
 && rm -rf /var/lib/apt/lists/*

# Build and install Google Test
RUN mkdir gtest-build \
 && cd gtest-build \
 && export CXX=g++ CC=gcc \
 && cmake \
    -DBUILD_GTEST:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
    /usr/src/googletest \
 && cmake --build . \
 && cmake --build . --target install \
 && cd .. \
 && rm -rf gtest-build
