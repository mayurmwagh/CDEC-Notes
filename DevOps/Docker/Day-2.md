# Docker Container Commands – Complete Notes

# 1. Introduction to Docker Containers

A **Docker Container** is a lightweight, portable, and isolated environment used to run applications along with all required dependencies.

Containers are created from Docker Images.

Example Flow:

```text
Docker Image  --->  Docker Container
```

Example:

```bash
docker run nginx
```

This command:

- Downloads the Nginx image (if not available)
- Creates a container
- Starts the container

---

# 2. Essential Commands for Container Management

| Command               | Purpose |
|---|---|
| docker run            | Create and start container |
| docker create         | Create container only |
| docker start          | Start existing container |
| docker stop           | Stop running container |
| docker rm             | Remove container |
| docker ps             | List running containers |
| docker exec           | Execute command inside container |
| docker logs           | View container logs |
| docker inspect        | Detailed container information |
| docker cp             | Copy files between host and container |
| docker stats          | Resource usage statistics |

---

# 3. Docker Run Command

## Syntax

```bash
docker run [OPTIONS] IMAGE [COMMAND]
```

---

# 4. Important docker run Options

---

# A. Run Container in Background (-d)

## Syntax

```bash
docker run -d nginx
```

## Explanation

- `-d` = Detached mode
- Container runs in background

## Example

```bash
docker run -d nginx
```

---

# B. Port Mapping (-p)

## Syntax

```bash
docker run -d -p HOST_PORT:CONTAINER_PORT IMAGE
```

## Example

```bash
docker run -d -p 8080:80 nginx
```

## Explanation

| Port          | Meaning           |
|---            |       ---         |
| 8080          | Host machine port |
| 80            | Container port    |

Access application:

```text
http://localhost:8080
```

---

# C. Random Port Mapping (-P)

## Syntax

```bash
docker run -d -P nginx
```

## Explanation

- Docker automatically maps ports randomly

Check assigned ports:

```bash
docker ps
```

Example Output:

```text
0.0.0.0:49153->80/tcp
```

---

# D. Environment Variables (-e)

## Syntax

```bash
docker run -e VARIABLE=value IMAGE
```

## Example

```bash
docker run -d -e MYSQL_ROOT_PASSWORD=admin mysql
```

## Explanation

Sets environment variable inside container.

---

# E. Naming Containers (--name)

## Syntax

```bash
docker run --name container_name IMAGE
```

## Example

```bash
docker run -d --name webserver nginx
```

## Benefits

- Easy identification
- Easy command execution

Example:

```bash
docker stop webserver
```

---

# 5. Create Container without Starting

# docker create

## Syntax

```bash
docker create IMAGE
```

## Example

```bash
docker create nginx
```

## Explanation

- Only creates container
- Does not start container

Check:

```bash
docker ps -a
```

Container state:

```text
Created
```

---

# 6. Start Existing Container

# docker start

## Syntax

```bash
docker start CONTAINER_ID
```

## Example

```bash
docker start webserver
```

---

# 7. Stop Running Container

# docker stop

## Syntax

```bash
docker stop CONTAINER_ID
```

## Example

```bash
docker stop webserver
```

## Explanation

Gracefully stops running container.

---

# 8. Remove Container

# docker rm

## Syntax

```bash
docker rm CONTAINER_ID
```

## Example

```bash
docker rm webserver
```

## Remove Multiple Containers

```bash
docker rm container1 container2
```

## Force Remove Running Container

```bash
docker rm -f webserver
```

---

# 9. List Containers

# docker ps

## Running Containers

```bash
docker ps
```

---

## All Containers (-a)

```bash
docker ps -a
```

Shows:

- Running containers
- Stopped containers
- Exited containers

---

## Show Only Container IDs (-q)

```bash
docker ps -q
```

---

## Combined Option (-aq)

```bash
docker ps -aq
```

## Explanation

- `-a` = all containers
- `-q` = only IDs

Useful for automation.

Example:

```bash
docker rm $(docker ps -aq)
```

Removes all containers.

---

# 10. Execute Commands Inside Container

# docker exec

## Syntax

```bash
docker exec [OPTIONS] CONTAINER COMMAND
```

---

# Interactive Terminal (-it)

## Example

```bash
docker exec -it webserver bash
```

## Explanation

| Option | Meaning          |
|---     |---               |
| -i     | Interactive mode |
| -t     | Terminal access  |

Now you are inside container shell.

Example:

```bash
ls
pwd
cat /etc/os-release
```

Exit container shell:

```bash
exit
```

---

# 11. Inspect Container Details

# docker inspect

## Syntax

```bash
docker inspect CONTAINER_ID
```

## Example

```bash
docker inspect webserver
```

## Information Provided

- IP Address
- Mounts
- Network details
- Environment variables
- Container state

---

# Get Container IP Address

```bash
docker inspect -f '{{.NetworkSettings.IPAddress}}' webserver
```

---

# 12. Copy Files Between Host and Container

# docker cp

---

# Copy File from Host to Container

## Syntax

```bash
docker cp file.txt container:/path
```

## Example

```bash
docker cp index.html webserver:/usr/share/nginx/html
```

---

# Copy File from Container to Host

## Syntax

```bash
docker cp container:/path/file .
```

## Example

```bash
docker cp webserver:/etc/nginx/nginx.conf .
```

---

# 13. View Container Logs

# docker logs

## Syntax

```bash
docker logs CONTAINER_ID
```

## Example

```bash
docker logs webserver
```

---

# Follow Live Logs (-f)

```bash
docker logs -f webserver
```

---

# Last Few Lines

```bash
docker logs --tail 20 webserver
```

---

# 14. Monitor Resource Usage

# docker stats

## Syntax

```bash
docker stats
```

## Example Output

| Container | CPU % | Memory |
|---        |---    |---     |   
| nginx     | 0.20% | 25MB   |

---

# Monitor Specific Container

```bash
docker stats webserver
```

---

# 15. Experiment – Complete Docker Workflow

---

# Step 1: Run Nginx Container

```bash
docker run -d --name mynginx -p 8080:80 nginx
```

---

# Step 2: Verify Running Container

```bash
docker ps
```

---

# Step 3: Open Application

Browser:

```text
http://localhost:8080
```

Nginx welcome page appears.

---

# Step 4: Access Container Shell

```bash
docker exec -it mynginx bash
```

---

# Step 5: Create HTML File Inside Container

```bash
echo "<h1>Docker Demo</h1>" > /usr/share/nginx/html/index.html
```

Exit shell:

```bash
exit
```

---

# Step 6: Refresh Browser

Now browser shows:

```text
Docker Demo
```

---

# Step 7: Check Logs

```bash
docker logs mynginx
```

---

# Step 8: View Resource Usage

```bash
docker stats mynginx
```

---

# Step 9: Stop Container

```bash
docker stop mynginx
```

---

# Step 10: Remove Container

```bash
docker rm mynginx
```

---

# 16. Troubleshooting Steps in Docker

---

# A. Container Not Starting

## Check Logs

```bash
docker logs container_name
```

---

# B. Port Already in Use

## Error

```text
Bind for 0.0.0.0:80 failed
```

## Solution

Use different port:

```bash
docker run -p 8080:80 nginx
```

---

# C. Check Running Containers

```bash
docker ps
```

---

# D. Verify Container Status

```bash
docker inspect container_name
```

---

# E. Check Resource Usage

```bash
docker stats
```

---

# F. Enter Container for Debugging

```bash
docker exec -it container_name bash
```

---

# 17. Important Docker Command Summary

| Command         |      Description              |
|---              |          ---                  | 
| docker run      |      Create + start container |
| docker create   |      Create only              |
| docker start    |      Start stopped container  |
| docker stop     |.     Stop running container   |
| docker rm       |.     Remove container         |
| docker ps       |      List running containers  |
| docker ps -aq   |      List all container IDs.  |
| docker exec -it |.     Interactive shell.       |
| docker inspect  |      Detailed information.    |
| docker logs     |.     View logs.               |
| docker cp       |      Copy files.              |
| docker stats    |      Resource monitoring      |

---

# 18. Best Practices

- Use meaningful container names
- Remove unused containers
- Use detached mode for production
- Monitor logs regularly
- Use port mapping carefully
- Avoid running containers as root
- Use environment variables for configurations

---

# 19. Real-Time Example Commands

## Run Ubuntu Container

```bash
docker run -it ubuntu bash
```

---

## Run Apache Web Server

```bash
docker run -d --name apache -p 8080:80 httpd
```

---

## Run MySQL Database

```bash
docker run -d \
--name mysql-db \
-e MYSQL_ROOT_PASSWORD=admin123 \
-p 3306:3306 \
mysql
```

---

# 20. Conclusion

Docker container commands help in:

- Creating containers
- Managing lifecycle
- Monitoring applications
- Debugging issues
- Exposing applications
- Running isolated environments

These commands are essential for:

- DevOps Engineers
- Cloud Engineers
- Developers
- System Administrators
- Kubernetes Administrators