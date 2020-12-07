FROM alpine:3.12

LABEL maintainer="Jeremy Garigliet <jeremy.garigliet@gmail.com>"

# Set timezone
ARG TZONE
ENV TZONE="${TZONE:-Europe/Paris}"
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    echo "Europe/Paris" > /etc/timezone && \
    date && \
    apk del tzdata

RUN apk add --no-cache \
      openssh-client \
      rsync \
      jq \
      nano \
      curl \
      tar
