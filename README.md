Bolt CMS Docker image
=====================

A docker image to run the [Bolt CMS](https://bolt.cm/).

Usage
-----

```
docker run  -d --name bolt -p 80:2015 unitedasian/bolt:latest
```

You can run bolt directly by running the image.

Custom project
--------------

If you want to keep the code of your bolt website under version control, but not have to include all the original bolt cms code, then follow this procedure:

In a new repo, create the following directories and files:

* app
  * config
    * // include your custom config files here
    * extensions
      // include your extensions here
* files
* theme

Create a new Dockerfile with the following content:

```
FROM unitedasian/bolt:latest

COPY ./app/config /var/www/html/app/config

COPY ./files /var/www/html/public/files

COPY ./theme/ /var/www/html/public
```

Build and run the image.

Note that bolt.cms allows you to modify the config files, the templates directly from within the app. Obviously these changes will not be under version control.


