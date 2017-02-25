Bolt CMS Docker image
=====================

A docker image to run the [https://bolt.cm/](Bolt CMS).

Usage
-----

```
docker run  -d --name bolt -p 80:2015 unitedasian/bolt:latest
```

Custom project
--------------

Create a new repo. You only need to include the following directories:

* app
  * config
    * // include your custom config files here
* files
* theme

Create a new Dockerfile with the following content:

```
FROM unitedasian/bolt:latest

COPY ./app/config /var/www/html/app/config

COPY ./files /var/www/html/public/files

COPY ./theme/ /var/www/html/public
```
