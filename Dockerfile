FROM ubuntu:16.04

RUN  apt-get update && apt-get install git libcurl4-openssl-dev build-essential libjansson-dev autotools-dev automake -y && git clone https://github.com/hyc/cpuminer-multi && cd cpuminer-multi && ./autogen.sh && CFLAGS="-march=native" ./configure  && make

COPY miner.sh /

RUN chmod +x /miner.sh

CMD /miner.sh