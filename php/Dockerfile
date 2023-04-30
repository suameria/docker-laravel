ARG PHP_VERSION
FROM --platform=linux/amd64 php:${PHP_VERSION}-fpm

RUN apt update

RUN apt install -y git zip unzip

# PHPの標準の拡張モジュールのインストール(有効化も含む)
RUN docker-php-ext-install \
    bcmath \
    opcache \
    pdo_mysql

# PHP Extension Community Library インストールし有効化
RUN pecl install apcu && \
    docker-php-ext-enable apcu

# nodejs インストール
ARG NODE_URL
RUN curl -fsSL ${NODE_URL} | bash -
RUN apt-get install -y nodejs

COPY ./.bashrc /root/.bashrc

COPY ./config/${PHP_VERSION}-php.ini /usr/local/etc/php/php.ini

# Composer インストール
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /home/htdocs
