# EK9000 IOC Docker Container

Sample of how to run an EK9000 IOC in a portable docker container.

## Why?

The ek9000 is a modbus to EtherCAT coupler, allowing easy communication 
with EtherCAT E-Bus devices using Modbus TCP. Since Modbus operates over 
a standard network connection, minimal setup is actually required to get 
an IOC running in docker; no need to share serial ports or other devices, 
you just need a network bridge between the container and the host. 

In total, setup took about an hour, most of that time spent getting 
epics modules to build in the container.

TODO: Expand on this

## Usage

TODO
