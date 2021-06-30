#!/bin/sh
set -e 
cd /epics/ioc/ek9000
make -j$(nproc)
cd "iocBoot/$IOC"
./st.cmd
