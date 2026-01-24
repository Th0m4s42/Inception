# Inception - Developer Documentation

## Prerequisites

| Software | Minimum Version | Recommended Version | Installation |
|----------|----------------|---------------------|--------------|
| Docker Engine | 20.10.0 | Latest stable | [Install Docker](https://docs.docker.com/engine/install/) |
| Docker Compose | 2.0.0 | Latest stable | Included with Docker Desktop |
| Make | 4.0 | Latest stable | `apt install make` or `pacman -S make` |
| Git | 2.0 | Latest stable | `apt install git` or `pacman -S git` |

**Configure domain resolution:**
```bash
# Add to /etc/hosts
echo "127.0.0.1 thbasse.42.fr" | sudo tee -a /etc/hosts
```

Next you should create your .env file in srcs and should be something like this:
```bash
DOMAIN_NAME=thbasse.42.fr

# MYSQL SETUP
MYSQL_USER=user
MYSQL_PASSWORD=123456789
MYSQL_DATABASE=wordpress
MYSQL_ROOT_PASSWORD=123456789

# WORDPRESS SETUP
WORDPRESS_VERSION=latest
WORDPRESS_TITLE=inception
WORDPRESS_ADMIN_USER=someone
WORDPRESS_ADMIN_PASSWORD=123456789
WORDPRESS_ADMIN_EMAIL=someone@email.com
WORDPRESS_USER=thbasse
WORDPRESS_PASSWORD=123456789
WORDPRESS_EMAIL=thbasse@42paris.fr

```

## Build and launch

You can use as well the makefile or docker-compose with the docker-compose.yml:

- To build:
```bash
make
```
or
```bash
docker-compose up --build
```
- To clean up:
```bash
make down
```
or
```bash
docker compose down
docker-compose down -v
```
or (for clean volume too)
```bash
make fclean
```
or
```bash
docker system prune -af
```

## Usefull commands for dockers
As well use the makefile or docker-compose:
- To see images:
```bash
make images
```
or
```bash
docker images
```
- To see networks:
 ```bash
make networks
```
or
```bash
docker network ls
```
- To check volumes:
```bash
docker volume inspect <volume_name>
```

## Data

**Data Storage:** Persistent volume at `/var/lib/mysql`
