setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
server:
	docker exec -it laravel-docker bash
composer-update:
	docker exec laravel-docker bash -c "composer update"
controller: 
	docker exec laravel-docker bash -c "php artisan make:controller routeController"
data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"

	