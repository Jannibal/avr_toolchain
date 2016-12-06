FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y flex byacc bison gcc libusb-1.0-0 libusb-1.0-0-dev libc6-dev curl build-essential

WORKDIR /root
RUN curl http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz > binutils.tar.gz
RUN tar -xvzf binutils.tar.gz
RUN rm binutils.tar.gz

WORKDIR /root/binutils-2.27
RUN ./configure --target=avr --program-prefix="avr-"
RUN make
RUN make install

WORKDIR /root
RUN curl http://www.netgull.com/gcc/releases/gcc-6.2.0/gcc-6.2.0.tar.bz2 > gcc-6.2.0.tar.bz
RUN tar -xjf gcc-6.2.0.tar.bz
WORKDIR /root/gcc-6.2.0
RUN apt-get install -y wget
RUN ./contrib/download_prerequisites

RUN mkdir avrgcc-6.2.0
WORKDIR /root/avrgcc-6.2.0

RUN ../gcc-6.2.0/configure --target=avr --enable-languages=c --disable-libssp
RUN make
RUN make install

WORKDIR /root
RUN curl http://gnu.mirrors.pair.com/savannah/savannah//avr-libc/avr-libc-1.8.1.tar.bz2 > avr-libc-1.8.1.tar.bz2
RUN tar -xf avr-libc-1.8.1.tar.bz2
WORKDIR /root/avr-libc-1.8.1
RUN ./configure --host=avr
RUN make
RUN make install

WORKDIR /root
RUN curl http://gnu.mirrors.pair.com/savannah/savannah//avrdude/avrdude-6.3.tar.gz > avrdude-6.3.tar.gz
RUN tar -xvzf avrdude-6.3.tar.gz
WORKDIR /root/avrdude-6.3
RUN ./configure
RUN make
RUN make install

WORKDIR /root
RUN rm *.bz
RUN rm *.bz2
RUN rm *.tar.gz

