1️⃣ Understanding the Linux Command Prompt

The command prompt is where you type commands in Linux.
It appears when you open a Terminal.

A typical Linux command prompt looks like this:

mayur@ubuntu:~$

What it tells you:

mayur → Username

@ubuntu → System/Hostname

~ → Current directory (~ = home directory)

$ → Normal user prompt

# → Root user prompt

Purpose:

Allows users to execute commands

Interact with the system

Control files, directories, processes, etc.

2️⃣ Decoding the Structure of the Command Prompt

Let’s break the prompt:

[username]@[hostname]:[current_path][symbol]

3️⃣ Effective Command Prompt Usage: Step-by-Step Guide
Step 1 — View where you are:
pwd

Step 2 — List files:
ls

Step 3 — Move between directories:
cd /path/to/directory

Step 4 — Create files:
touch file1.txt

Step 5 — Edit files:
nano file1.txt

Step 6 — View file contents:
cat file1.txt

Step 7 — Remove files or folders:
rm file1.txt
rm -r foldername

Step 8 — Use Tab for auto-complete

Helps speed and reduces mistakes.

Step 9 — Use Up/Down arrow

Shows command history.



5️⃣ Introduction to Linux Basic Commands
File & Directory Commands
Command	Purpose

ls	    List files
cd	    Change directory
pwd	    Show current directory
mkdir	Create directory
rmdir	Remove empty directory
rm	    Remove files
cp	    Copy files
mv	    Move/Rename files

File  Viewing Commands
Command	Purpose
cat	    View file
less	View file page-by-page
head	View first 10 lines
tail	View last 10 lines

Permission Commands
Command	Purpose
chmod	Change permissions
chown	Change ownership
chgrp	Change group

6️⃣ Getting Started with the Linux Terminal

Opening the terminal:
Ubuntu: Ctrl + Alt + T
CentOS/RHEL: Applications → System Tools → Terminal
Mac: Applications → Utilities → Terminal
Windows (WSL): Ubuntu app
Important Terminal Concepts:

Case sensitive
File.txt and file.txt are different.

Absolute path:
/home/student/docs

Relative path:
docs/notes

Safe practices:

Be careful with rm -rf — dangerous.

Use sudo only when necessary.

7️⃣ Essential System Information Commands & Tools
System Information
uname -a

Shows kernel version and architecture.

Check hostname:
hostname

CPU Info:
lscpu

Memory Info:
free -h

Disk Usage:
df -h

Directory Size:
du -sh /path

Running processes:
ps aux

Real-time system monitoring:
top

or

htop


1 touch
2 mkdir
3 ls 
4 pwd
6 ll
7 cd
8  uname  system info
10 w ---display all current user details.
11 ctrl + l ----clear terminal.
12 date
13 --help ---ex uname --help -----show detail page info
14 man --man cd------show detail page info
15 which --ex--which pwd ---path shows of any command.
16.info --ex--info cd---show detail page info
17 echo 
18 su --switch user ---root to local or local to root.
19 ls -ltr ---short recent activity at bottom.
20 ls -a --show hidden file
21 hostname
22 dmidecode----show h/w info
23 free -h
cal -j
cal 
cal -y ----year show
24 tty --current user terminal no.
25 history --shows history of cmds.

    