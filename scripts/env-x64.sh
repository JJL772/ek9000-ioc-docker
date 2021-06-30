#!/bin/bash
export CC="gcc"
export CXX="g++"
export EPICS_HOST_ARCH="linux-x86_64"
export EPICS_BASE="/epics/base"
export EPICS_EXTENSIONS="/epics/modules"
export PATH="${EPICS_BASE}/bin/${EPICS_HOST_ARCH}:${PATH}"
export PATH="${EPICS_EXTENSIONS}/bin/${EPICS_HOST_ARCH}:${PATH}"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${EPICS_EXTENSIONS}/lib/${EPICS_HOST_ARCH}"
export EPICS_CA_AUTO_ADDR_LIST=NO
export EPICS_CA_ADDR_LIST=127.255.255.255
