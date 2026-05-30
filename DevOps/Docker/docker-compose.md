1. Brief Introduction to Docker Compose

Docker Compose is a tool used to define and run multi-container Docker applications.

Instead of starting each container manually, you can define all services in a single YAML file named:

docker-compose.yml

or

compose.yaml

Using one command, Docker Compose can:

Create containers
Create networks
Create volumes
Start all services
Stop all services
Remove everything


2. Why Use Docker Compose?

Suppose your application consists of:

Frontend (Angular/React)
Backend (Spring Boot/Node.js)
Database (MySQL/PostgreSQL)

Without Docker Compose, you would need to run multiple docker run commands manually.

With Docker Compose, everything is managed in one file and can be started with:

docker compose up -d

3. Real-World Example

A typical web application contains three layers:

Frontend Layer – User Interface
Backend Layer – Business Logic
Database Layer – Data Storage

Docker Compose allows all three containers to communicate automatically.

4. Docker Compose Architecture

docker-compose.yml
        |
        v
+---------------------------+
|      Docker Compose       |
+---------------------------+
        |
        v
+---------------------------+
|  Custom Network Creation  |
+---------------------------+
        |
        v
+-----------+  +-----------+  +-----------+
| Frontend  |  | Backend   |  | Database  |
| Container |  | Container |  | Container |
+-----------+  +-----------+  +-----------+'


5. Docker Compose Installation

Modern Docker includes Docker Compose automatically.

Verify installation:

docker compose version

Example output:

Docker Compose version v2.39.4

Official documentation: Docker Compose Documentation

6. Docker Compose File Structure


services:
  service-name:
    image: image-name
    ports:
      - "host:container"
    environment:
      VARIABLE: value
    volumes:
      - volume-name:/path
    depends_on:
      - another-service
volumes:
  volume-name:


7. Important Keywords in Docker Compose

version

Older Compose files used a version: field, but it is optional in modern Docker Compose.

services

Defines all containers.

image

Specifies which Docker image to use.

build

Builds an image from a Dockerfile.

ports

Maps host ports to container ports.

environment

Sets environment variables.

volumes

Mounts persistent storage.

networks

Defines custom networks.

depends_on

Controls startup order.

restart

Automatically restarts containers.


8. Simple Docker Compose Example
services:
  web:
    image: nginx
    ports:
      - "8080:80"

Run:

docker compose up -d

Access:

http://localhost:8080


9. Docker Compose Commands

Start Services
docker compose up

Start in Background
docker compose up -d

Stop Services
docker compose stop

Stop and Remove Containers
docker compose down

View Running Containers
docker compose ps

View Logs
docker compose logs

Follow Logs
docker compose logs -f

Rebuild Images
docker compose up --build

Scale Services
docker compose up --scale backend=3 -d

10. Deploy Three-Tier Application Using Docker Compose
Application Architecture
User
  |
  v
Frontend (Nginx)
  |
  v
Backend (Spring Boot)
  |
  v
MySQL Database

11. Project Structure
three-tier-app/
│
├── docker-compose.yml



services:
  apache:
    build: ./apache
    container_name: apache-server
    ports:
      - "8081:80"
    restart: always

  nginx:
    build: ./nginx
    container_name: nginx-server
    ports:
      - "8082:80"
    restart: always


service:
  apache:
    build: ./apache 
    container_name: apache-server 
    ports:
      - "8081:80"
    restart: always 

  nginx: 
    build: ./nginx
    container_name: nginx-server 
    ports:
      - "8082:80"
    restart: always 