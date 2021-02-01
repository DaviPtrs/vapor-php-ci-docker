FROM ubuntu:latest

# Pre-configuring timezone
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installing Docker CLI
RUN apt update && \
    apt install -y curl && \
    curl -fsSL https://get.docker.com | bash -

# Installing NPM/Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install -y nodejs && \
    apt clean

# Installing PHP, PHP dependencies and PHP Composer
RUN apt install -y wget php \
    php-zip \
    php-mbstring \
    php-simplexml \
    php-gd \
    php-curl \
    zip \
    unzip \
    && wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet \
    && apt clean \
    && mv composer.phar /usr/bin/composer

# Installing Vapor CLI
RUN composer global require laravel/vapor-cli

# Adding Vapor CLI bin to PATH
ENV PATH=$PATH:/root/.composer/vendor/bin
    