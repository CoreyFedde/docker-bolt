build:
	docker build -t unitedasian/bolt:local .

run:
	docker run -d --name bolt -p 2015:2015 unitedasian/bolt:local

stop:
	docker kill bolt
	docker rm bolt
