# SNMP Simulator

This docker image starts up snmpsim.

The UDP port `161` should be mapped to the desired SNMP port.

By default this image contains an snmpwalk from `demo.snmplabs.com` under community name `demo`.

To use your own snmpwalks you should mount a folder with snmpwalks like this:

    docker run -v /somewhere/with/snmpwalks:/usr/share/snmpsim/data \
               -p 161:161/udp \
               tandrup/snmpsim

The filename determines the SNMP community name.
