# Dockerfile Complete Notes with Practical Examples

---

# 1. Introduction to Dockerfile

A **Dockerfile** is a text file that contains instructions to automatically build a Docker image.

It defines:

- Base image
- Software installation
- Application code copy
- Environment variables
- Startup commands

## Why Use Dockerfile?

- Automates image creation
- Ensures consistency
- Easy to share and version control
- Supports CI/CD pipelines

---

# 2. Basic Dockerfile Structure

```dockerfile
# Base Image
FROM ubuntu:22.04

# Install packages
RUN apt-get update && apt-get install -y nginx

# Expose port
EXPOSE 80

# Start application
CMD ["nginx", "-g", "daemon off;"]



3. Dockerfile Instructions
FROM

Defines the base image.

Syntax
FROM image:tag
Example
FROM ubuntu:22.04
Practical Example
FROM python:3.12

This starts with an image containing Python 3.12.

# LABEL

# Adds metadata to the image.

# # Syntax
# # LABEL key="value"
# # Example
# # LABEL maintainer="mayur@example.com"
# # LABEL version="1.0"
# # LABEL description="Python Flask Application"
# # View Labels
# # docker inspect myimage


RUN

Executes commands during image build.

Syntax
RUN command
Example
RUN apt-get update && apt-get install -y curl
Practical Example
RUN pip install flask
CMD

Defines the default command to run when a container starts.

Syntax
CMD ["executable", "param1", "param2"]


ENTRYPOINT

Sets the main executable for the container.

Syntax
ENTRYPOINT ["executable"]
Example
ENTRYPOINT ["python"]
CMD ["app.py"]



     CMD     vs      ENTRYPOINT
Feature	                    CMD	            ENTRYPOINT
Can be overridden easily	Yes	                No
Used for default arguments	Yes	                Yes
Main executable         	No	                Yes

ENV

Sets environment variables.

Syntax
ENV KEY=value
Example
ENV APP_ENV=production
ENV PORT=5000



COPY

Copies files from host to image.

Syntax
COPY source destination
Example
COPY app.py /app/
COPY requirements.txt /app/
Practical Example
COPY . /app


ADD

Copies files and can extract tar archives or download URLs.

Syntax
ADD source destination
Example
ADD app.tar.gz /app/

Difference Between  COPY and ADD
Feature         	COPY	ADD
Copy files	        Yes	    Yes
Extract tar files	 No	    Yes
Download URLs	     No	    Yes

Best Practice: Prefer COPY unless you specifically need ADD.

EXPOSE

Documents which port the application listens on.

Syntax
EXPOSE port

Example
EXPOSE 5000

Multiple Ports
EXPOSE 80 443


USER

Specifies the user to run commands and containers.

Syntax
USER username
Example
RUN useradd appuser
USER appuser



# Use Ubuntu as the base image
FROM ubuntu:24.04
 

# Update package list and install Apache HTTP Server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a simple web page
RUN echo "<h1>Apache HTTP Server Running on Ubuntu Container</h1>" \
    > /var/www/html/index.html

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]