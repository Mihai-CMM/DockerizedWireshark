#Made by Mihai -- just for fun 

From ubuntu:16.04
MAINTAINER Mihai <costache.mircea.mihai@gmail.com>

# Installing required additional software needed for wireshark download
RUN apt-get update -y && \
    apt-get install wget bzip2 gcc python perl pkg-config libglib2.0-dev libpcap-dev gtk2.0  -y && \
    rm -rf /var/lib/apt/lists/*

# Download and build latest wireshark
RUN wget https://1.eu.dl.wireshark.org/src/wireshark-2.2.1.tar.bz2 && \
    tar -jxf wireshark-2.2.1.tar.bz2 && \
    /wireshark-2.2.1/configure && make && make install
 
RUN ldconfig

ENTRYPOINT ["wireshark-gtk"]
