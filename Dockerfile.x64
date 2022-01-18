ARG BASE_TAG=x64

FROM forumi0721/alpine-buildbase:x64 as builder

LABEL maintainer="forumi0721@gmail.com"

COPY local/bin/docker-build-fail2ban /usr/local/bin/docker-build-fail2ban

RUN ["docker-build-fail2ban"]



FROM forumi0721/alpine-base:${BASE_TAG}

LABEL maintainer="forumi0721@gmail.com"

COPY --from=builder /output /app

COPY local/. /usr/local/

RUN ["docker-build"]

ENTRYPOINT ["docker-run"]

VOLUME /conf.d

