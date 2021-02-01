FROM debian:buster

RUN apt update && \
    apt install -y curl && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install -y nodejs && \
    apt clean

RUN apt install -y wget php && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet && \
    apt clean && \
    mv composer.phar /usr/bin/composer