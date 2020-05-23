# Dockerfile: hombre-ser2net

FROM hombrelab/hombre-alpine

ARG version

LABEL version="${version}"
LABEL description="Customized Ser2net Docker image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

RUN apk add --no-cache \
    ser2net

ADD ./app/ser2net.conf /etc/ser2net.conf

CMD /usr/sbin/ser2net -d -u