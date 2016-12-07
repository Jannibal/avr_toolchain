# Last updated: 12/7/2016
#
# AVR Development Toolchain
#
FROM ubuntu:latest

MAINTAINER Zach Dicklin <zdicklin@protonmail.com>

RUN apt-get update
RUN apt-get install -y flex byacc bison gcc libusb-1.0-0 libusb-1.0-0-dev libc6-dev curl build-essential gcc-avr binutils-avr avr-libc gdb-avr avrdude vim