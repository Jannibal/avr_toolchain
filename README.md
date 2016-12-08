# AVR Toolchain

AVR development environment, configured using Vagrant. Includes:

* avr-gcc
* avrdude

## USB ISP

Configured to use the USBTiny ISP. Update the Vagrantfile to support different ISPs.

## Getting Started

1. Install VirtualBox with the extension pack (required for USB).
2. Enable USB and the USBtiny for this VM in VirtualBox.
3. Create a directory `avr_development` at the same level as the `avr_toolchain` project. This is a shared directory for any code files.
4. `vagrant up`
5. `vagrant ssh`
6. Verify communication with USBtiny
  1. Unplug/plug USBtiny
  2. ```avrdude -c usbtiny -p m328p```
  3. Verify output is ```avrdude: initialization failed, rc=-1```, which indicates communication with programmer.