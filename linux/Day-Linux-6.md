Linux File System Hierarchy & Shortcuts – Detailed Notes
1. Mastering the Linux File System Hierarchy

Linux follows a standard directory structure, known as the Filesystem Hierarchy Standard (FHS).
This structure ensures consistency across Linux distributions.

Think of the Linux file system as an inverted tree:

/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── root
├── run
├── sbin
├── srv
├── tmp
├── usr
└── var


Here, / (root) is the top-level directory.

2. The Significance of the Linux File System Hierarchy

Why this structure matters:

Ensures uniformity across all Linux systems

Helps administrators quickly know where things are stored

Enhances security, separating system files from user files

Simplifies software installation and package management

Makes troubleshooting easier

Helps maintain a clean, predictable system layout

3. Inside the Linux Root Directory: What You Need to Know

Below is an overview of key directories under the root / directory:

/ – Root Directory

The topmost directory.

All files and folders originate from here.

/bin – Essential User Binaries

Contains basic commands needed for all users, even in rescue mode.

Examples:

ls, cp, mv, cat, rm, pwd

/sbin – System Binaries

Commands for system administration.

Examples:

fdisk, reboot, ifconfig, mount

/boot – Boot Loader Files

Contains:

Kernel (vmlinuz)

Boot loader config (GRUB)

/dev – Device Files

Includes special files representing hardware.

Examples:

/dev/sda  – Hard disk
/dev/tty  – Terminal
/dev/usb  – USB interfaces

/etc – Configuration Files

Stores system-wide config files.

Examples:

/etc/passwd
/etc/fstab
/etc/shadow
/etc/group
/etc/ssh/sshd_config

/home – User Home Directories

Each user gets a personal directory.

Example:

/home/student

/root – Root User Home Directory

Home directory for the system administrator.

/lib, /lib64 – Shared Libraries

Stores:

Libraries required by /bin and /sbin

Kernel modules

/media – Auto-Mounted Devices

Used for removable media.

Examples:

USB, CD-ROM

/mnt – Temporary Mount Directory

Used to manually mount filesystems.

/opt – Optional Software

Used by third-party applications.

/usr – User Programs & Applications

One of the largest directories.

Key subdirectories:

/usr/bin

/usr/sbin

/usr/lib

/usr/share

/var – Variable Files

Contains files that grow over time.

Examples:

/var/log
/var/spool
/var/cache

/tmp – Temporary Files

Used by apps for temporary storage.
Files are usually cleared on reboot.

4. Understanding the Functionality of Common Linux Directories
Directory	Purpose	            Examples
/bin	Basic commands	        ls, cp, cat
/sbin	Admin commands	        fdisk, mount
/etc	Config files	        passwd, ssh config
/home	User files	            docs, downloads
/root	Root user’s home	    root’s personal files
/usr	Installed software	    /usr/bin
/var	Logs & variable data	/var/log/messages
/tmp	Temporary data	        app temp files
/dev	Device files	        sda, tty
/boot	Boot files	            grub.cfg
/mnt	Manual mount point	    mount /dev/sdb1
/media	Auto-mounted devices	USB drives


5. Introduction to Linux Shortcuts: Boost Your Efficiency

Shortcuts make navigation and file management much faster.

5.1 Directory Shortcuts
Shortcut    	Meaning         	Example
.	            Current directory	cd .
..	            Parent directory	cd ..
~	            Home directory	    cd ~
/	            Root directory	    cd /

5.2 Shell Navigation Shortcuts

Shortcut	    Function
Ctrl + C	    Stop/kill a running process
Ctrl + Z	    Pause process (send to background)
Ctrl + D	    Logout / End terminal input
Ctrl + L	    Clear screen (like clear)
↑ / ↓	        Scroll through command history
Tab	            Auto-complete commands and files

5.3 File Management Shortcuts
Shortcut	        Action
!!	                Run last command again
!ls	                Run last ls command
history	            Show previous commands
cd -	            Go to previous directory
touch {a,b,c}.txt	Create multiple files at once


