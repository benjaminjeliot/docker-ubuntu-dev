# Copyright 2024 (c) Jim Eliot

FROM ubuntu:24.04

LABEL maintainer="benjaminjeliot@gmail.com"

RUN apt-get update \
   && apt-get install -y --no-install-recommends \
   ca-certificates \
   cmake \
   gcc \
   g++ \
   gfortran \
   git \
   make \
   wget \
   && rm -rf /var/lib/apt/lists/*

# Build and install Google Test
RUN cd \
   && git clone -b v1.14.0 https://github.com/google/googletest.git \
   && mkdir googletest-build \
   && cd googletest-build \
   && export CXX=g++ CC=gcc \
   && cmake \
   -DBUILD_GTEST:BOOL=ON \
   -DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
   ../googletest \
   && cmake --build . \
   && cmake --install . \
   && cd .. \
   && rm -rf googletest googletest-build
