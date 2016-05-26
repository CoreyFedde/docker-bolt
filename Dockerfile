FROM tgbyte/nginx-php-fpm

MAINTAINER Olivier Pichon <op@united-asian.com>

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y \
		curl \
		git \
		locales \
		php5-apcu \
		php5-curl \
		php5-gd \
		php5-intl \
		php5-json \
		php5-mcrypt \
		php5-mysql \
		supervisor \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& cd /var \
	&& git clone git://github.com/bolt/bolt.git www \
	&& cd www \
	&& git checkout v3.0.2 \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer install

COPY files /

WORKDIR /var/www

EXPOSE 80 443

ENTRYPOINT "/entrypoint.sh"
