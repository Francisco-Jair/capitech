FROM --platform= ubuntu:18.04 as phpbase


ARG PHP_VERSION=5.6
SHELL [ "/bin/bash", "-c" ]
ENV DEBIAN_FRONTEND=noninteractive


# Add user to run localy (dev only) the app
# RUN addgroup meteoruser &&  useradd -rm -d /home/moff -s /bin/bash -g root -G sudo -u 1000 meteoruser


# Update APT database and upgrade all packages before installing new ones
RUN apt-get update -y && apt-get upgrade -y


# Install unzip utility and libs needed by zip PHP extension 
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip 


# install git
RUN apt-get install git -y


# Install PHP
RUN export LANG=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
RUN apt-get install -y software-properties-common
RUN apt-get install -y gnupg2
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
# https://superuser.com/questions/620765/sudo-apt-key-adv-keyserver-keyserver-ubuntu-com-recv-7f0ceb10-command-return
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys
RUN add-apt-repository ppa:ondrej/php
RUN apt-get install -y php${PHP_VERSION}


# Install Composer
RUN apt-get install curl -y
RUN curl -O "https://getcomposer.org/download/2.2.18/composer.phar"
RUN chmod a+x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Install PHP extensions
RUN apt-get install -y software-properties-common locales gnupg
RUN apt-get install -y php${PHP_VERSION}-xml php${PHP_VERSION}-mbstring php${PHP_VERSION}-gd php${PHP_VERSION}-curl

RUN apt-get install php5.6-mysql
RUN apt-get install php5.6-zip


# Config apache
RUN apt-get install -y apache2
RUN apt-get install -y apt-utils
RUN apt-get install -y libapache2-mod-php5.6


# RUN mkdir /var/moodledata
COPY docker/apache-site.conf /etc/apache2/sites-available/apache-site.conf


# set path
RUN rm /var/www/html/index.html
RUN mkdir /var/moodledat
RUN mkdir /var/www/moodledata

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /var/moodledat
RUN chown -R www-data:www-data /var/www/moodledata


CMD apachectl -D FOREGROUND