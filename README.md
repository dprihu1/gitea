# Gitea Server Setup - User & System Requirements

## System Requirements
- **Operating System:** Linux (Ubuntu/Debian recommended)
- **CPU:** 1+ core
- **RAM:** 512MB minimum (1GB+ recommended)
- **Disk Space:** 500MB minimum (more for large repositories)
- **Network:** Static IP recommended for server access

## Software Requirements
- **Git**
- **wget**
- **sqlite3** (or MySQL/MariaDB/PostgreSQL if preferred)
- **Systemd** (for service management)

## User Requirements
- **Admin (root/sudo) access** to install packages and manage services
- **Basic Linux command line knowledge**
- **A dedicated system user** (e.g., `git`) for running Gitea

## Optional (for production use)
- **Domain name** (for easier access)
- **SSL certificate** (for HTTPS)
- **Backup solution** for repositories and configuration

## Quick Install Steps
1. Install dependencies: `sudo apt update && sudo apt install -y git wget sqlite3`
2. Create a dedicated user: `sudo adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git`
3. Download and install Gitea binary
4. Set up directories and permissions
5. Create and enable a systemd service for Gitea
6. Access Gitea at `http://<your-server-ip>:3000` and complete web setup

See the install script or documentation for detailed instructions.
