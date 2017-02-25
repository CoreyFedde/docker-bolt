FROM unitedasian/caddy

MAINTAINER Olivier Pichon <op@united-asian.com>

COPY Caddyfile /etc/Caddyfile

RUN apt-get update && apt-get install -y --force-yes \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && cd /var/www \
    && rm -rf html \
    && composer create-project bolt/composer-install:~3.2.2 html --prefer-dist --no-interaction \
    && cd html \
	&& chown -R www-data:www-data . \
	&& chmod -R 777 app/cache/ app/config/ app/database/ extensions/ \
	&& chmod -R 777 public/thumbs/ public/extensions/ public/files/ public/theme/

WORKDIR /var/www/html
