1. Why File Permissions Matter in Linux
1.1 Security

Prevents unauthorized users from reading sensitive files (e.g., /etc/shadow, configuration files, scripts).

Ensures that only trusted users can execute important programs.

Protects the system from misuse, malware, and accidental damage.

1.2 Data Privacy

User home directories contain private files.

Permissions ensure one user cannot view or modify another user’s data (unless intended).

1.3 System Stability

Critical system files must not be altered by regular users.

Permissions ensure that only administrators (root) can modify system binaries and configuration files.

1.4 Prevents Accidental Deletion or Modification

Users may accidentally remove or edit files if permissions are too open.

Permissions restrict this, ensuring safe operations.

1.5 Controlled Sharing

Permissions + groups allow controlled collaboration.

Team members can share files by giving group read/write access.



How Permissions Are Displayed with ls -l – Detailed Notes

The ls -l command in Linux displays file and directory details in long listing format, including permissions, ownership, size, and timestamps.
The first column in the output shows the permission string that defines what actions users can perform on the file.

Example:

$ ls -l
-rw-r--r-- 1 root root  1200 Jan 10 10:23 file.txt


Let’s break it down.

1. Structure of Permission String

The permission string contains 10 characters:

[1] [2][3][4] [5][6][7] [8][9][10]


Example:

-rw-r--r--


These 10 characters represent:

1st character → File type
Characters 2–4 → Owner permissions
Characters 5–7 → Group permissions
Characters 8–10 → Other permissions


Permission Set

-rw-r--r-- 1 root root 0 Nov 20 18:45 demo.txt


1️⃣ File Type + Permissions → -rw-r--r--

This field has 10 characters:

1st character → File Type

- → regular file
d → directory
l → symlink


Here it is - = regular file.

Next 9 characters → Permissions
They are divided into 3 groups:

Group	Permission	Meaning
rw-	owner	owner can read & write
r--	group	group can only read
r--	others	others can only read

So final permissions:

Owner: read, write
Group: read
Others: read

2️⃣ Link Count → 1

This shows how many hard links the file has.
For most normal files it is 1.

3️⃣ Owner → root

This is the username of the owner of the file.

4️⃣ Group → root

This is the group that owns the file.

5️⃣ File Size → 0

Size of the file in bytes.

Here the file is empty.

6️⃣ Date & Time Modified → Nov 20 18:45

This shows the last modification date and time of the file.

Month: Nov

Day: 20

Time: 18:45

7️⃣ File Name → demo.txt

This is simply the name of the file.

Final Summary
Field	Meaning
-rw-r--r--        	File type + permissions
1	                Number of hard links
root	            Owner
root	            Group
0	                File size in bytes
Nov 20 18:45.    	Last modified date/time
demo.txt	        File name


Perission Details 
rwx 

r - Read 
w - Write 
x - Execute


1 owner/user = u  
2 group  = g
3 other  = o 

command = chmod 
+ : add permission
= : Set the permission
- : remove permission


chmod u+r, u+w, u+x 
u-r, u-w, u-x
u+rw, u+wx 
u=rw, u=x 

chmod og+r, ug+rw 

chmod a+rwx 

Number representations

read = 4
write = 2
execute = 1 


user 
         = 4+2 = 6 
group      4+1 = 5 


permissiom                   file                dir
read r:             read the file content    read the dir
                            cat              content 
write w:            change the content       create a file
                          vim                   touch

execute x:          execute the file.        cd in dir 



File Types

Symbol	        File Type	        Description
-	            Regular File	    Text, binary, scripts, images
d	            Directory	        Folder
l	            Symbolic Link	    Shortcut to another file
c	            Character Device	Character-by-character devices
b	            Block Device	    Disk/block devices
p	            FIFO / Named Pipe	Communication between processes
s	            Socket	            Communication with network/programs