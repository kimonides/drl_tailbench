FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt update
RUN apt-get -y install software-properties-common
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt-get update
RUN apt -y install openjdk-8-jdk
RUN apt-get -y --assume-yes install gcc automake autoconf libtool bison swig build-essential vim python3.7 pkg-config python3-pip zlib1g-dev uuid-dev libboost-all-dev cmake libgtk2.0-dev pkg-config libqt4-dev unzip wget libjasper-dev libpng-dev libjpeg-dev libtiff5-dev libgdk-pixbuf2.0-dev libopenexr-dev libbz2-dev tk-dev tcl-dev g++ git subversion automake libtool zlib1g-dev libicu-dev libboost-all-dev liblzma-dev python-dev graphviz imagemagick make cmake libgoogle-perftools-dev autoconf doxygen

WORKDIR /
RUN wget https://github.com/opencv/opencv/archive/2.4.13.5.zip -O opencv-2.4.13.5.zip
RUN unzip opencv-2.4.13.5.zip
WORKDIR /opencv-2.4.13.5
RUN mkdir release
WORKDIR /opencv-2.4.13.5/release
RUN cmake -G "Unix Makefiles" -DCMAKE_CXX_COMPILER=/usr/bin/g++ CMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_TBB=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_V4L=ON -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DBUILD_FAT_JAVA_LIB=ON -DINSTALL_TO_MANGLED_PATHS=ON -DINSTALL_CREATE_DISTRIB=ON -DINSTALL_TESTS=ON -DENABLE_FAST_MATH=ON -DWITH_IMAGEIO=ON -DBUILD_SHARED_LIBS=OFF -DWITH_GSTREAMER=ON ..
RUN make all -j$(nproc)
RUN make install

RUN pip3 install developer-tools

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY sphinx /sphinx

WORKDIR /sphinx/sphinxbase-5prealpha/
RUN ./autogen.sh && \
    ./configure  && \
    make         && \
    make install

WORKDIR /sphinx/pocketsphinx-5prealpha
RUN ./configure && \
    make        && \
    make install


COPY tailbench-v0.9 /tailbench-v0.9

WORKDIR /
RUN echo "JDK_PATH=/usr/lib/jvm/java-8-openjdk-amd64" > tailbench-v0.9/Makefile.config

ENV LD_LIBRARY_PATH=/usr/local/lib
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

WORKDIR /tailbench-v0.9/harness
RUN ./build.sh

WORKDIR /tailbench-v0.9/sphinx
RUN ./build.sh

WORKDIR /tailbench-v0.9/xapian/xapian-core-1.2.13
RUN ./configure --prefix=${PWD}/install
RUN sed -i 's/CXX = g++/CXX = g++ -std=c++03/g' Makefile
RUN make -j6 && make install
WORKDIR /tailbench-v0.9/xapian
RUN ./build.sh

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/tailbench-v0.9/xapian/xapian-core-1.2.13/.libs

WORKDIR /tailbench-v0.9/moses
RUN ./build.sh

WORKDIR /tailbench-v0.9/img-dnn
RUN ./build.sh