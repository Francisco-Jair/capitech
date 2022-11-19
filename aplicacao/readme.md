docker build -t captech_teste -f ./Dockerfile . 

composer install 
php artisan serve


*PHP:* 5.6.40

*Composer version:* 2.2.18


*extensões:*

php5.6-xml
php5.6-mbstring
php5.6-gd
php5.6-curl


php artisan migrate
php artisan db:seed --class="GestorTableSeeder" 



https://stackoverflow.com/questions/36373835/how-to-make-sqlite-work-in-laravel
https://dev.to/nfo94/como-criar-um-container-com-mysql-server-com-docker-e-conecta-lo-no-workbench-linux-1blf


apt-get install php-pgsql -y



DB_CONNECTION=pgsql
DB_HOST=banco_postgres
DB_DATABASE=postgres
DB_USERNAME=postgres
DB_PASSWORD=postgres