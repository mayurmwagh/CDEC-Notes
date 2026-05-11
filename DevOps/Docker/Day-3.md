# Docker Images and Docker Registries

---

# 1. Introduction to Docker Images

A **Docker Image** is a lightweight, standalone, executable package that contains:

- Application code
- Runtime
- Libraries
- Dependencies
- Configuration files

Docker images are used to create Docker containers.

## Key Points

- Images are **read-only templates**
- Containers are **running instances** of images
- Images are built in layers
- Images can be shared using registries like Docker Hub or Amazon ECR

---

# 2. Docker Image Naming Convention

Docker images follow this format:

```bash
[REGISTRY]/[USERNAME]/[IMAGE_NAME]:[TAG]
```

## Example

```bash
nginx:latest
```

Breakdown:

| Part      | Meaning |
|---|---    |
| nginx     | Image name |
| latest    | Tag/version |

---

## Another Example

```bash
docker.io/library/ubuntu:22.04
```

| Part      | Meaning    |
|.  ---     |---         |
| docker.io | Registry   |
| library   | Default namespace |
| ubuntu    | Image |
| 22.04     | Tag |

---

# 3. Introduction to Docker Hub

Docker Hub is the default public Docker registry.

Website: https://hub.docker.com

It allows users to:

- Store Docker images
- Share images publicly
- Pull ready-made images
- Push custom images

## Popular Docker Hub Images

- Ubuntu
- Nginx
- MySQL
- Redis
- Jenkins

---

# 4. Introduction to Amazon ECR

Amazon ECR (Elastic Container Registry) is AWS's private Docker image registry service.

Website: https://aws.amazon.com/ecr/

## Features

- Secure image storage
- IAM integration
- Private repositories
- High availability
- Integrated with ECS/EKS

---

# 5. Docker Image Commands

---

# docker images

Displays all Docker images available locally.

## Syntax

```bash
docker images
```

## Example

```bash
docker images
```

## Sample Output

```bash
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    4e5021d210f6   2 weeks ago   77MB
nginx        latest    605c77e624dd   3 weeks ago   142MB
```

---

# docker pull

Downloads an image from Docker Hub.

## Syntax

```bash
docker pull <image-name>
```

## Example

```bash
docker pull nginx
```

## Pull Specific Version

```bash
docker pull ubuntu:22.04
```

---

# docker login

Authenticates to Docker Hub or another registry.

## Syntax

```bash
docker login
```

## Example

```bash
docker login
```

Then enter:

```text
Username
Password
```

---

# docker push

Uploads an image to Docker Hub or another registry.

## Syntax

```bash
docker push <image-name>
```

## Example

```bash
docker push mayurwagh/myapp:v1
```

---

# docker commit

Creates a new image from a running container.

## Syntax

```bash
docker commit <container-id> <new-image-name>
```

## Example

```bash
docker commit mycontainer ubuntu-custom:v1
```

---

# docker tag

Creates another tag/name for an image.

## Syntax

```bash
docker tag <source-image> <target-image>
```

## Example

```bash
docker tag nginx mayurwagh/nginx:v1
```

---

# docker image rm

Removes a Docker image.

## Syntax

```bash
docker image rm <image-id>
```

## Example

```bash
docker image rm nginx
```

---

# docker rmi

Shortcut command to remove Docker images.

## Syntax

```bash
docker rmi <image-id>
```

## Example

```bash
docker rmi ubuntu
```

---

# docker save

Exports a Docker image into a tar archive.

Useful for backup or offline transfer.

## Syntax

```bash
docker save -o <file-name.tar> <image-name>
```

## Example

```bash
docker save -o nginx.tar nginx
```

---

# docker load

Loads Docker images from a tar archive.

## Syntax

```bash
docker load -i <file-name.tar>
```

## Example

```bash
docker load -i nginx.tar
```

---

# docker image prune

Removes unused dangling images.

## Syntax

```bash
docker image prune
```

## Example

```bash
docker image prune
```

## Remove All Unused Images

```bash
docker image prune -a
```

---

# Practical Workflow Example

## Step 1: Pull Image

```bash
docker pull nginx
```

---

## Step 2: Check Images

```bash
docker images
```

---

## Step 3: Run Container

```bash
docker run -d --name web nginx
```

---

## Step 4: Commit Container

```bash
docker commit web my-nginx:v1
```

---

## Step 5: Tag Image

```bash
docker tag my-nginx:v1 mayurwagh/my-nginx:v1
```

---

## Step 6: Login to Docker Hub

```bash
docker login
```

---

## Step 7: Push Image

```bash
docker push mayurwagh/my-nginx:v1
```

---

# Difference Between Docker Hub and Amazon ECR

| Feature        | Docker Hub          | Amazon ECR           |
|---             |.  ---               |      ---             |
| Type           | Public Registry     | AWS Private Registry |
| Authentication | Docker Credentials  | IAM                  |
| Integration    | General Docker      | AWS ECS/EKS          |
| Public Images  | Yes                 | Optional             |
| Pricing        | Free + Paid         | AWS Pricing          |

---

# Important Interview Questions

## Q1. What is a Docker Image?

A Docker image is a read-only template used to create containers.

---

## Q2. Difference between Image and Container?

| Image          | Container        |
|---             |---               |
| Template       | Running instance |
| Read-only      | Read-write       |
| Static         | Dynamic          |

---

## Q3. What is Docker Hub?

Docker Hub is a cloud-based registry service used to store and share Docker images.

---

## Q4. What is Docker Tag?

Docker tag creates another reference/name for an image.

---

## Q5. What is the use of docker save and load?

| Command | Purpose |
|---|---|
| docker save | Export image |
| docker load | Import image |

---

# Summary

| Command | Purpose |
|---|---|
| docker images | List images |
| docker pull | Download image |
| docker login | Authenticate |
| docker push | Upload image |
| docker commit | Create image from container |
| docker tag | Create image tag |
| docker rmi | Remove image |
| docker save | Export image |
| docker load | Import image |
| docker image prune | Remove unused images |
