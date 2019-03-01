FROM alpine/git as git

WORKDIR /

RUN git config --global core.autocrlf false
RUN git clone https://github.com/KoffeinFlummi/armake.git



FROM ubuntu as build

COPY --from=git /armake /armake

WORKDIR /armake

RUN apt-get update
RUN apt-get install libssl-dev \
                    make \
                    build-essential \
                    bison \
                    flex -y

# Clear cache
RUN apt-get clean && rm -rf /srv/lib/apt/lists/*

RUN make
# RUN make install

FROM frolvlad/alpine-glibc

LABEL maintainer="adam.jarvis2012@gmail.com"

COPY --from=build /armake/bin/armake /usr/bin/armake

VOLUME /arma
WORKDIR /arma


ENTRYPOINT ["armake"]
CMD ["--help"]
