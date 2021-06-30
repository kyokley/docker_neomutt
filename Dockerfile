# Dockerfile for NeoMutt plus 'essentials'
# Largely inspired by Jess Frazelle (@jessfraz)
#
FROM python:3.9-alpine

RUN apk --no-cache add \
        ca-certificates

ENV HOME /home/user
RUN adduser -u 1000 -D user \
        && mkdir -p $HOME/.mutt

ENV LANG C.UTF-8

ENV NEOMUTT_RELEASE 20210205

RUN set -x \
        && apk add --no-cache --virtual .build-deps \
                alpine-sdk \
                autoconf \
                automake \
                build-base \
                coreutils \
                clang \
                cmake \
                curl \
                dpkg-dev dpkg \
                g++ \
                glib-dev \
                gnupg \
                libc-dev \
                libxslt-dev \
                libidn-dev \
                libtool \
                links \
                linux-headers \
                m4 \
                make \
                musl-dev \
                ncurses-dev \
                openssl \
                openssl-dev \
                gdbm-dev \
                pkgconf \
                tar \
                unzip \
                xz \
                python3-dev \
                gcc \
        && apk add --no-cache \
                git \
                w3m \
                neovim
RUN wget "https://github.com/neomutt/neomutt/archive/refs/tags/${NEOMUTT_RELEASE}.tar.gz" -P /tmp/ \
        && wget "https://github.com/neomutt/neomutt/archive/refs/tags/${NEOMUTT_RELEASE}.zip" -P /tmp/ \
        && wget "https://github.com/neomutt/neomutt/releases/download/${NEOMUTT_RELEASE}/${NEOMUTT_RELEASE}-CHECKSUM" -P /tmp/ \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver keyserver.ubuntu.com --recv-keys 86C2397270DD7A561263CA4E5FAF0A6EE7371805 \
        && gpg --verify /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && cd /tmp/ && sha256sum -c /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && rm -rf "$GNUPGHOME" /tmp/${NEOMUTT_RELEASE}-CHECKSUM \
        && mkdir -p /usr/src/neomutt \
        && tar -xf /tmp/${NEOMUTT_RELEASE}.tar.gz -C /usr/src/neomutt --strip-components 1 \
        && rm /tmp/*.tar.gz /tmp/*.zip \
        && cd /usr/src/neomutt \
        && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        && ./configure \
                --prefix=/usr/local \
                --homespool \
                --gdbm \
                --disable-doc \
                --ssl \
        && make -j "$(nproc)" \
        && make install \
        && rm -rf /usr/src/neomutt \
        && runDeps="$( \
                scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
                        | tr ',' '\n' \
                        | sort -u \
                        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )" \
        && apk add --no-cache --virtual .neomutt-rundeps \
                                        $runDeps \
                                        msmtp \
        && cd $HOME \
        && pip install neovim

COPY mailcap $HOME/.mailcap
COPY nvim $HOME/.config/nvim
RUN mkdir -p /root/.nvim/plugged $HOME/.nvim \
        && /usr/bin/nvim -c 'PlugInstall' -c 'qa' \
        && cp -r /root/.nvim/plugged $HOME/.nvim/plugged \
        && apk del .build-deps \
        && chown -R user:user $HOME

WORKDIR $HOME
USER user

CMD ["neomutt"]
