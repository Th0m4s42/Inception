*This project has been created as part of the 42 curriculum by thbasse.*

# Inception

## Description

Inception is a system admininistrastion project that focused on containerzation

- Each service runs in dedicated Docker container
- Containers are built from Alpine Linux (penultimate stable version)
- Docker images are built using custom Dockerfiles
- The infrastucture consists of:
	- **NGINX** wuth TLSv1.2 or TLSv1.3 only
	- **WordPress** with php-fpm
	- **MariaDB**

All services communicate through a Docker network and use volumes for data persistences.

## Quick Start

### Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.0+
- Make
- Sudo privileges

### Installation

1. Clone the repository:
```bash
git clone <repository's link> Inception
cd Inception
```

2. Configure your environment:
```bash
# Add domain to /etc/hosts
echo "127.0.0.1 thbasse.42.fr" | sudo tee -a /etc/hosts
```

3. Add Credentials (= .env)
```bash
vim srcs/.env
```

Add these lines
```
DOMAIN_NAME = thbasse.42.fr

# MYSQL SETUP
MYSQL_USER = thbasse
MYSQL_PASSWORD = 123456789
MYSQL_DATABASE = wordpress
MYSQL_ROOT_PASSWORD = 123456789

# WORDPRESS SETUP
WORDPRESS_VERSION = latest
WORDPRESS_TITLE = Inception
WORDPRESS_ADMIN_USER = someone
WORDPRESS_ADMIN_PASSWORD = 123456789
WORDPRESS_ADMIN_EMAIL = someone@email.com
WORDPRESS_USER = thbasse
WORDPRESS_PASSWORD = 123456789
WORDPRESS_EMAIL = thbasse@42.student.fr
```

**Security Warning:** These are default credentials

## Makefile Commands

```bash

make			# Build and start all services
make down		# Stop the services and remove volumes
make fclean		# Clean everything including images
make restart	# Restart all services
make re			# Rebuils from scratch
make ps			# Show running containers
make images		# List Docker images
make networks	# List Docker networks
```

## Resources

## A.I. Usages

Decript obscur errors/warnings
Correct some lines of scripts (bad inputs most of the time)
Readme/User_doc/Dec_doc structure