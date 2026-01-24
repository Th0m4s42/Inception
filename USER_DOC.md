# Inception - User Documentation

This guide provides instructions for users who want to run and manage the Inception infrastructure.

## Starting the Stack

### First Time Setup

1. **Ensure prerequisites are installed:**
```bash
docker --version    # Should be 20.10+
docker compose version  # Should be 2.0+
```

2. **Configure your hosts file:**
```bash
echo "127.0.0.1 thbasse.42.fr" | sudo tee -a /etc/hosts
```

3. **Start the infrastructure:**
```bash
make
```
This command will:
- Create necessary data directories (`/home/thbasse/data/wordpress` and `/home/thbasse/data/mariadb`)
- Build Docker images for each service
- Start all containers in detached mode
- Initialize the database
- Install and configure WordPress

## Accessing the Admin Panel

### WordPress Admin Access

1. **Navigate to the admin login page:**
	```
	https://thbasse.42.fr/wp-admin
	```
	(You'll be redirected to the login page if not authenticated)

2. **Log in with admin credentials:**
	- **Username:** `someone`
	- **Password:** `123456789`

3. **Admin Dashboard Features:**
	- Posts and Pages management
	- Media library
	- Appearance settings (themes/widgets)
	- Plugins management
	- User management
	- Settings configuration

## Basic Health Checks

### Check Container Status

```bash
# List running containers
make ps
# or
docker ps

# Expected output: 3 containers running (nginx, wordpress, mariadb)
```

Example output:
```
CONTAINER ID   IMAGE       STATUS         PORTS                         NAMES
abc123def456   nginx       Up 2 minutes   0.0.0.0:80->80/tcp, 443->443  nginx
def456ghi789   wordpress   Up 2 minutes   9000/tcp                      wordpress
ghi789jkl012   mariadb     Up 2 minutes   3306/tcp                      mariadb
```

### Check Container Logs

```bash
# View nginx logs
docker logs nginx

# View WordPress logs
docker logs wordpress

# Follow logs in real-time
docker logs -f wordpress
```

### Changing Credentials

**Important:** Changing credentials after initial setup requires database updates.

#### For Fresh Installation

Edit the `.env` file before first run:

```bash
nano .env
```

Update desired values:
```env
WORDPRESS_ADMIN_USER = your_username
WORDPRESS_ADMIN_PASSWORD = your_secure_password
WORDPRESS_ADMIN_EMAIL = your_email@example.com
MYSQL_PASSWORD = your_db_password
```

Then start the stack:
```bash
make
```
