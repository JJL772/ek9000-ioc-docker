FROM debian:stable
WORKDIR /epics
RUN apt-get update
RUN apt-get install -y gcc g++ make python3 git 
COPY env-x64.sh /epics/env-x64.sh

# Clone + install epics base
RUN git clone --recursive --branch R7.0.5 https://github.com/epics-base/epics-base base 
RUN bash -c 'source /epics/env-x64.sh && cd /epics/base && make -j$(nproc)'

RUN mkdir /epics/modules

# Clone + install asyn module
RUN git clone --recursive --branch R4-42 https://github.com/epics-modules/asyn /epics/modules/asyn
COPY asyn-release.local /epics/modules/asyn/configure/RELEASE.local
RUN bash -c 'source /epics/env-x64.sh && cd /epics/modules/asyn && make -j$(nproc)'

# Clone + install modbus module
RUN git clone --recursive --branch R3-2 https://github.com/epics-modules/modbus /epics/modules/modbus
COPY modbus-release.local /epics/modules/modbus/configure/RELEASE.local
RUN bash -c 'source /epics/env-x64.sh && cd /epics/modules/modbus && make -j$(nproc)'

# Clone + install motor module
RUN git clone --recursive --branch R7-2-2 https://github.com/epics-modules/motor /epics/modules/motor
COPY motor-release.local /epics/modules/motor/configure/RELEASE.local
RUN bash -c 'source /epics/env-x64.sh && cd /epics/modules/motor && make -j$(nproc)'

# Clone + install ek9000 module
RUN git clone --recursive --branch dev https://github.com/slaclab/epics-ek9000 /epics/modules/ek9000
COPY ek9000-release.local /epics/modules/ek9000/configure/RELEASE.local
RUN bash -c 'source /epics/env-x64.sh && cd /epics/modules/ek9000 && make ENABLE_MOTOR_SUPPORT=1 -j$(nproc)'

# Final IOC setup
RUN mkdir /epics/ioc/ek9000/
COPY ./ioc /epics/ioc/ek9000/

# Final setup
EXPOSE 502
