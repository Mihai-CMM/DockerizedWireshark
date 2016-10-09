#Made by Mihai -- just for fun 

From ubuntu:16.04
MAINTAINER Mihai <costache.mircea.mihai@gmail.com>

# Installling required additional software
RUN apt-get update -y
RUN apt-get install wget bzip2 -y  # needed for wireshark download
RUN apt-get install gcc python -y
RUN apt-get install perl pkg-config libglib2.0-dev libpcap-dev gtk2.0 -y


# Donwload and build latest wireshark
RUN wget https://1.eu.dl.wireshark.org/src/wireshark-2.2.1.tar.bz2
RUN tar -jxf wireshark-2.2.1.tar.bz2 
RUN  /wireshark-2.2.1/configure && make && make install
 
RUN ldconfig

ENTRYPOINT ["wireshark-gtk"]
