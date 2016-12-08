#Made by Mihai -- just for fun 


From ubuntu:16.04
MAINTAINER Mihai <costache.mircea.mihai@gmail.com>

# Installing required additional software needed for wireshark download
RUN apt-get update -y && \
    apt-get install unzip autoconf libtool-bin automake wget  gcc python perl pkg-config libglib2.0-dev libpcap-dev gtk2.0  -y && \
    rm -rf /var/lib/apt/lists/*

# Download and build latest wireshark
RUN wget https://github.com/wireshark/wireshark/archive/master.zip && \
    unzip master.zip -d master && \
    master/wireshark-master/autogen.sh &&\
    master/wireshark-master/autogen.sh && make && make install

RUN ldconfig

ENTRYPOINT ["wireshark-gtk"]