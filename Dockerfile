FROM alpine:edge

ADD bird-wrapper.sh /opt/bird-wrapper.sh
ADD bird.conf /etc/bird.conf

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --no-cache bird

ENTRYPOINT ["/opt/bird-wrapper.sh"]
CMD ["/usr/sbin/birdc"]
