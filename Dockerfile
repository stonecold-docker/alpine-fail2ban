FROM forumi0721/alpine-buildbase:latest AS builder

LABEL maintainer="forumi0721@gmail.com"

COPY local/bin/docker-build-fail2ban /usr/local/bin/docker-build-fail2ban

RUN ["docker-build-fail2ban"]



FROM forumi0721/alpine-base:latest

LABEL maintainer="forumi0721@gmail.com"

COPY --from=builder /output /app

COPY local/. /usr/local/

RUN ["docker-build"]

ENTRYPOINT ["docker-run"]

VOLUME /conf.d

