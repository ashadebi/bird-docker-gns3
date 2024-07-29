FROM debian:stable

EXPOSE 179

RUN apt-get update && apt-get install -y \
        autoconf \
	bison \
	nano net-tools htop mtr bind9-dnsutils dnsutils \
	build-essential \
	curl \
	flex \
	libreadline-dev \
	libncurses5-dev \
	m4 \
	unzip

WORKDIR /root
RUN curl -O -L https://bird.network.cz/download/bird-2.15.1.tar.gz
RUN tar -zxvf bird-2.15.1.tar.gz

RUN mkdir /etc/bird
RUN cd bird-2.15.1 && \
	autoconf && \
	autoheader && \
	./configure && \
	make && \
	make install
COPY bird.conf /etc/bird/bird.conf
CMD bird -c /etc/bird/bird.conf -d
