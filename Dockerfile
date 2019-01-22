FROM ubuntu:16.04
WORKDIR /root
RUN apt-get update
RUN apt-get install -y build-essential flex bison libc6-dev-i386 gcc-multilib g++-multilib byacc
RUN apt-get install -y git

## DiNo
# RUN git clone https://github.com/KCL-Planning/DiNo dino
#RUN cd dino/src && make 

RUN apt-get install -y emacs
RUN apt-get update
RUN apt-get install -y cmake coinor-libcbc-dev coinor-libclp-dev coinor-libcoinutils-dev libbz2-dev bison flex
RUN apt-get install -y  coinor-libcgl-dev libgsl-dev
RUN apt-get install -y zlib1g-dev

#### OPTIC ####
WORKDIR /root
RUN git clone https://github.com/arthur-bit-monnot/optic.git

WORKDIR /root/optic
RUN ./run-cmake-release
RUN ./build-release
RUN cp release/optic/optic-clp /usr/local/bin/

#### RUNSOLVER ####
WORKDIR /root
RUN apt-get install -y libnuma-dev
RUN git clone https://github.com/arthur-bit-monnot/runsolver.git

WORKDIR /root/runsolver

RUN make
RUN cp runsolver /usr/local/bin/


#WORKDIR /root/dino/ex
#WORKDIR /wd
