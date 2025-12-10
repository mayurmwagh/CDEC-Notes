1. Overview of User and Permission Management

User and permission management in Linux ensures:

System security

Controlled access to files and directories

Proper multi-user environment

Linux is a multi-user operating system, meaning multiple users can log in and work simultaneously without affecting each other.

Key components:

Users

Groups

Ownership

Permissions (r, w, x)

2. Types of Users

Linux has three main types of users:

🔹 1. Root User

The superuser with full administrative privileges.

Can read/write/delete any file.

Can install/remove software.

Has UID = 0.

Login name: root

🔹 2. System Users

Created by the OS for running services.

Do not log in normally.

Examples:

daemon

bin

sshd

www-data

🔹 3. Normal/Regular Users

Created by admin for daily use.

Have limited permissions.

Home directory under:
/home/username

3. Using useradd Command

useradd is used to create new users.

Basic Syntax
useradd <username>

Create User with Home Directory
useradd -m mayur


This creates:

/home/mayur

Default shell (bash)

Useful Options
Option	Meaning
-m	Create user home directory
-s	Specify shell
-d	Set custom home directory
-u	Specify UID
-g	Set primary group
-G	Add user to supplementary groups
-c	Add comment (full name)
Example: Create user with details
useradd -m -s /bin/bash -c "Engineer" -G sudo devuser

4. Setting User Passwords

Use the passwd command.

Set Password for a User
passwd mayur


You will be asked to type the password twice.

Force Password Change on Next Login
passwd -e student

Lock a User Account
passwd -l mayur

Unlock a User Account
passwd -u mayur

5. Managing User Groups

Groups define permission boundaries.

Types of Groups

Primary Group: Assigned at user creation.

Secondary Group: Additional groups for permissions.

Add a New Group
groupadd trainers

Add User to a Group
usermod -aG trainers mayur

Change User’s Primary Group
usermod -g trainers mayur

Remove User from a Group

Edit the file manually:
/etc/group

6. Removing Users

Use the userdel command.

Delete User (Account Only)
userdel mayur

Delete User With Home Directory
userdel -r mayur


Removes:

User account

Home directory

Mail files

7. Introduction to Affected Files

When creating users, Linux modifies system configuration files.

Important Files
1. /etc/passwd

Stores user account information.
Format:

username:x:UID:GID:comment:home:shell


Example:

mayur:x:1001:1001:Mayur:/home/mayur:/bin/bash

2. /etc/shadow

Stores encrypted passwords.
Accessible only by root.

3. /etc/group

Stores group details.

Format:

group_name:x:GID:members

4. /etc/gshadow

Encrypted group passwords.

8. User Home Directories

Each user gets a personal directory under:

/home/username


Contains:

Documents

Downloads

Personal files

Hidden config files (dotfiles)

.bashrc

.profile

Created automatically using:

/etc/skel/ (template folder)

9. Configuration Files

When a new user is created:

Default settings come from /etc/skel/

Important config files:

.bashrc → terminal settings

.profile → environment variables

.bash_logout → cleanup commands

System-wide config files:

/etc/login.defs

/etc/default/useradd

These control:

Password aging

Home directory permissions

Default shell

10. Switching Between Users in Linux

Two ways:

1. Using su
Switch to Another User
su username

Switch to Root
su -


Loads root environment.

2. Using sudo

Used to execute commands with root privileges.

11. Using su Command (Detailed)

su = substitute user

Switch to Another User Without Password
su mayur

Switch With Full Environment
su - mayur

Switch to Root
su -


Requires root password.

12. Using sudo Command (Detailed)

Allows users to run commands as root using their own password.

Syntax
sudo <command>

Example
sudo apt update

Give Sudo Access to a User
usermod -aG sudo mayur


or

visudo


Add line:

mayur ALL=(ALL) ALL

Benefits of sudo

No need to share root password

Command logs stored in /var/log/auth.log

Controlled access




Not in ERP attendance of CDEC-50 
4/12/25

Aditya 
Nikita
Kunal 
Bhavna

25 jan joining 