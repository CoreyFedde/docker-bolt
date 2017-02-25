FROM unitedasian/caddy

MAINTAINER Olivier Pichon <op@united-asian.com>

COPY Caddyfile /etc/Caddyfile

WORKDIR /var/www/html

COPY bolt.yml /var/www/html
COPY composer.json /var/www/html

RUN apt-get update && apt-get install -y --force-yes \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
	&& mkdir -p app/cache \
	&& mkdir -p app/config \
	&& mkdir -p app/database \
	&& mkdir -p public/theme \
	&& mkdir -p public/files \
	&& mkdir -p public/bolt-public/view \
	&& mkdir -p public/thumbs \
	&& mkdir -p public/extensions \
	&& mkdir -p extensions \
	&& composer install --no-scripts \
	&& composer run-script post-create-project-cmd \
	&& composer run-script post-install-cmd \
	&& chown -R www-data:www-data . \
	&& chmod -R 777 app/cache/ app/config/ app/database/ extensions/ \
	&& chmod -R 777 public/thumbs/ public/extensions/ public/files/ public/theme/
