This is a gist written to show how a MediaWiki image with loaded extensions and several basic pages may be built. The data used here comes from the [Vocaloid Lyrics Wiki](https://vocaloidlyrics.miraheze.org), which is subject to copyright under **[the CC-BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/)**. 

## Building the image
1. Clone this GitHub project into your given project directory.
2. Run the following command: 
```sh
# e.g. docker build . -t vlw-mediawiki:latest
docker build . -t <IMAGE NAME>:<TAG>
```

## Running the container

### Required volume mounts
> The folder `db` comprises the database of the MediaWiki application, which uses a lightweight SQLITE database flat file. This file contains the templates and modules that are needed to parse a given page. This folder should be mounted onto the directory `/var/www/data` on your container.

> The file LocalSettings.php comprises the wiki's configuration (including configuration on the extensions and skins that should be loaded). This file should be mounted onto the directory `/var/www/html/LocalSettings.php` on your container.

### Optional volume mounts
- Uploaded images are not persisted onto the container unless a volume is mounted to the directory `/var/www/html/images` on the container.
- This image is loaded with the default skins only. Skins are loaded from `/var/www/html/skins` on the container. NOTE: Mounting a volume to this directory may cause the pre-existing skins to disappear.
- This image is loaded with the most important extensions that are used on VLW. Extensions are loaded from `/var/www/html/extensions` on the container. NOTE: Mounting a volume to this directory may cause the pre-existing extensions to disappear.

### Docker command
1. Once the image is built, you can either run the container either with `docker run`:
```sh
docker run -p 8080:80 -v "/path/to/db/folder:/var/www/data" -v "/path/to/LocalSettings.php:/var/www/html/LocalSettings.php" -d vlw-mediawiki
```
2. Alternatively, use Docker Compose:
  
```sh
"docker-compose.yaml"

version: '0.1'
services:
  web:
    image: vlw-mediawiki
    restart: unless-stopped
    volumes:
      - ./db:/var/www/data
      - ./LocalSettings.php:/var/www/html/LocalSettings.php
    ports: 
      - 8080:80
```

```sh
docker compose up -d
```

## Using the Wiki

### Port

The MediaWiki app is configured to be hosted on `http://localhost:8080`. If hosting this app on another host/port, remember to edit the following line on LocalSettings.php:
```php
# Change with another host/port
$wgServer = "http://localhost:8080";
```

### Login Credentials
> User: Admin

> Password: mediawiki1234

### Action API

The [MediaWiki Action API](https://www.mediawiki.org/wiki/API:Action_API) is located on `http://localhost:8080/api.php`.

### Special:ExpandTemplates

The special page Special:ExpandTemplates (`http://localhost:8080/index.php?title=Special:ExpandTemplates`) provides a web interface to parse a given wikitext.