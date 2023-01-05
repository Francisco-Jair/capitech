docker build -t captech_teste -f ./Dockerfile .
docker build -t moodle_teste -f ./Dockerfile .
docker build --no-cache -t captech_teste -f ./Dockerfile .
sleep 90

# para rotar
0. Criar arquivo .env
1. composer install
2. 
php artisan serve




docker run --name apache_moodle -it moodle_teste bash
<!-- docker run --name banco_captech -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7 -->
mysql 5.7 -> mysql:5.7-debian docker

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



2022-12-21 20:01:11     - MYSQL_ROOT_PASSWORD
2022-12-21 20:01:11     - MYSQL_ALLOW_EMPTY_PASSWORD
2022-12-21 20:01:11     - MYSQL_RANDOM_ROOT_PASSWORD


para logar no banco
mysql -u root -p





1. roda script no banco (banco_limpo)
2. rodar a views_rupert.sql




para ver o ip
docker inspect imagem


mysql -u root -p capacitacoes > banco_limpo.sql -> para rodar dentro do container(via cmd)



http://keidinfo.blogspot.com/2010/04/executar-arquivo-sql-em-mysql-por-linha.html



-------------- FINAL ----------
0. Criar o arquivo .env
1. Roda o docker-compose
2. Loga no phpAdmin e executa os scrips de banco no arquivo (scripts_banco) na ordem que está lá
3. Depois vai no docker da aplicacao e roda os comandos (php artisan migrate && php artisan db:seed --class="GestorTableSeeder")
4.






docker build -t moodle_teste -f ./moodle/Dockerfile .
docker container run --name moodle_teste -p 80:80 -it moodle_teste



https://computadorcomwindows.com/2018/03/15/tutorial-como-usar-o-apache-para-apresentar-um-site-usando-um-port-virtual-host/