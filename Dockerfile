# FROM php:8.1 as php
FROM php:8.0-apache
WORKDIR /var/www/html

# Mod Rewrite
RUN apt-get install -y apache2
RUN a2enmod rewrite

# Linux Library
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# PHP Extension
RUN docker-php-ext-install gettext intl pdo_mysql gd

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

    # Download working docker file using the below link
	# https://docs.docker.com/desktop/previous-versions/3.x-mac/

    # Step one:
    # Run "make setup" command without quote

    # Step two:
    # Run "make composer-update" without quote
    
    # Step four:
    # Run "make server" without quote

    # Create new laravel project
    # composer create-project laravel/laravel .

    # In case dataa refuse to insert when you run "make data" command,
    # Go to database/seeders/DatabseSeeder.php and uncomment the below line
    # \App\Models\User::factory(10)->create();

    # Finally localhost:9000 won't work unless you use localhost:9000/public
    # Or you can use the .htaccess file while i created here, it will rewrite the engine