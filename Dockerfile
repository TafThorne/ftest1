# Other Libraries to correspond with fdev1

#Compile any tools we cannot install from packages
FROM gcc:7 as builder
USER 0
RUN \
  apt-get -y update && \
  apt-get -y install \
    clang \
    libc++-dev \
    libgflags-dev \
    libgtest-dev
RUN \
  # Protocol Buffer & gRPC
  # install protobuf first, then grpc
  git clone -b $(curl -L https://grpc.io/release) \
      https://github.com/grpc/grpc /var/local/git/grpc && \
    cd /var/local/git/grpc && \
    git submodule update --init && \
    echo "--- installing protobuf ---" && \
    cd third_party/protobuf && \
    ./autogen.sh && ./configure --enable-shared && \
    make -j$(nproc) && make install && make clean && ldconfig && \
    echo "--- installing grpc ---" && \
    cd /var/local/git/grpc && \
    make -j$(nproc) && make install && make clean && ldconfig


FROM tafthorne/netcat-debian
LABEL \
 Description="Basic Debian production environment with a number of libraries configured" \
 MAINTAINER="Thomas Thorne <TafThorne@GoogleMail.com>"
# Copy over pre-made tools
# Protocol Buffer
COPY --from=builder /usr/local/lib/libproto* /usr/local/lib/
# gRPC
COPY --from=builder /usr/local/lib/libgrpc* /usr/local/lib/
# Install remaining tools using apt-get
RUN apt-get -y update && \
  apt-get -y install \
    libhdf5-dev \
    uuid-dev;

