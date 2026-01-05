APT (Advanced Package Tool) – Ubuntu Package Manager

APT is the default and most commonly used package management system in Ubuntu. It simplifies the process of installing, updating, upgrading, and removing software packages.

Key Features of APT

Automatically handles dependencies

Uses central repositories

Works with .deb packages

Simple and user-friendly commands

Secure (packages are signed and verified)

Common APT Commands

# sudo apt update

Updates the local package index from repositories.

# sudo apt upgrade

Upgrades all installed packages to the latest versions.

# sudo apt install package-name
    eg. apt install nginx 

Installs a new package.

# sudo apt remove package-name

Removes a package (keeps config files).

# sudo apt purge package-name

Removes package along with configuration files.

# sudo apt search keyword

Searches for available packages.

# sudo apt show package-name

Displays detailed information about a package.

APT Repository Locations

Repository list file:

/etc/apt/sources.list


Additional repository files:

/etc/apt/sources.list.d/

APT Cache

APT stores downloaded package information locally to speed up operations.

/var/lib/apt/lists/

APT vs DPKG

APT	                        DPKG
High-level tool     	    Low-level tool
Resolves dependencies	    No dependency resolution
Uses online repositories	Installs local .deb files

Why APT is Important

Ensures system stability

Makes software management easy

Saves time by handling dependencies automatically

Essential for Linux system administrators



APT is a high-level package management tool in Ubuntu used to install, update, upgrade, and remove software while automatically handling dependencies.




Internet Download Commands in Ubuntu
1️⃣ wget – Most Common (CLI Download Tool)

Used to download files directly from a URL.

wget https://example.com/file.zip

Features:

Supports HTTP, HTTPS, FTP

Resume downloads

Background download

Examples:

wget -c https://example.com/file.zip    # Resume download
wget -O myfile.zip https://example.com/file.zip   # Save with different name

2️⃣ curl – Flexible Data Transfer Tool

Mostly used for APIs, but also downloads files.

curl -O https://example.com/file.zip


Examples:

curl -o file.zip https://example.com/file.zip   # Custom filename
curl -L https://example.com/file.zip             # Follow redirects


3️⃣ scp – Secure Copy (Remote Server Download)

Download files from a remote Linux server using SSH.

scp user@remote_ip:/path/file.zip /local/path/

4️⃣ rsync – Efficient File Transfer

Used for large files and syncing data.

rsync -avz user@remote_ip:/path/file.zip /local/path/


6 Browser-based Download (GUI)

Firefox

Chrome

(Default download location: ~/Downloads)

Quick Comparison
Command	                Use Case
wget	                Simple file download
curl	                APIs & data transfer
scp	                    Secure remote download
rsync	                Large file transfer


wget: Used to download files from the internet via CLI

curl: Transfers data from URLs

scp: Secure file copy over SSH

