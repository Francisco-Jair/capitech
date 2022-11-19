FROM --platform= ubuntu:18.04 as phpbase

ARG PHP_VERSION=5.6
SHELL [ "/bin/bash", "-c" ]
ENV DEBIAN_FRONTEND=noninteractive

# Update APT database and upgrade all packages before installing new ones
RUN apt-get update && apt-get upgrade -y

# RUN apt update \
#         && apt install -y \
#             g++ \
#             libicu-dev \
#             libpq-dev \
#             libzip-dev \
#             zip \
#             zlib1g-dev \
#         && docker-php-ext-install \
#             intl \
#             opcache \
#             pdo \
#             pdo_pgsql \
#             pgsql 

# Install unzip utility and libs needed by zip PHP extension 
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip 
    # && docker-php-ext-install \
    # pdo_pgsql \
    # pgsql

# install git
RUN apt-get install git -y


# 
# RUN docker-php-ext-install bcmath pdo pdo_pgsql


# Install PHP
# RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8

RUN apt-get install -y software-properties-common
RUN apt-get install -y gnupg2
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886

RUN add-apt-repository -y ppa:ondrej/php
RUN apt install -y php${PHP_VERSION}

# Install Composer
# RUN apt install -y composer
RUN apt install curl -y
RUN curl -O "https://getcomposer.org/download/2.2.18/composer.phar"
RUN chmod a+x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Install PHP extensions
# - php-xml
# - php-mbstring
# - php-gd
# - php-curl
RUN apt-get install -y software-properties-common locales gnupg
RUN apt install -y php${PHP_VERSION}-xml php${PHP_VERSION}-mbstring php${PHP_VERSION}-gd php${PHP_VERSION}-curl

# Set working directory on /var/www
WORKDIR /var/www/captech
# Copy repository files to /var/www/captech
COPY . /var/www/captech

RUN apt install -y nano
RUN apt-get install php5.6-sqlite
RUN apt-get install php5.6-pgsql -y

# RUN composer install -y
# RUN compose clear-cache
# RUN composer install --optimize-autoloader --no-dev --ignore-platform-reqs -d /var/www/captech
# RUN composer install --optimize-autoloader -d /var/www/captech

EXPOSE 8000

# Provide bash as default shell
CMD ["/bin/bash"]

# composer update
# php artisan serve