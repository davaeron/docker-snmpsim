FROM python:slim

RUN apt update

RUN apt install -y git

RUN pip install git+https://github.com/etingof/snmpsim.git

RUN adduser --system snmpsim

ADD data /home/snmpsim/.snmpsim/data

RUN ln -s /home/snmpsim/.snmpsim/data/1.3.6.1.6.1.1.0.snmprec /home/snmpsim/.snmpsim/data/public.snmprec

EXPOSE 161/udp

ENTRYPOINT ["snmpsim-command-responder", \
    "--process-user=snmpsim", "--process-group=nogroup", \
    "--v3-engine-id=80004fb805636c6f75644dab22cd", \
    "--data-dir=/home/snmpsim/.snmpsim/data", \
    "--v3-user=usr-none-none", \
    "--v3-user=usr-md5-none", "--v3-auth-key=authkey1", "--v3-auth-proto=MD5", \
    "--v3-user=usr-sha-none", "--v3-auth-key=authkey1", "--v3-auth-proto=SHA", \
    "--v3-user=usr-md5-des", "--v3-auth-key=authkey1", "--v3-auth-proto=MD5", "--v3-priv-key=privkey1", "--v3-priv-proto=DES", \
    "--v3-user=usr-sha-des", "--v3-auth-key=authkey1", "--v3-auth-proto=SHA", "--v3-priv-key=privkey1", "--v3-priv-proto=DES", \
    "--v3-user=usr-md5-aes", "--v3-auth-key=authkey1", "--v3-auth-proto=MD5", "--v3-priv-key=privkey1", "--v3-priv-proto=AES", \
    "--v3-user=usr-sha-aes", "--v3-auth-key=authkey1", "--v3-auth-proto=SHA", "--v3-priv-key=privkey1", "--v3-priv-proto=AES", \
    "--agent-udpv4-endpoint=0.0.0.0:161"]
