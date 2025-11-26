Archiving & Compression + CronTab – Complete Notes
1. Overview of Archiving

Archiving is the process of combining multiple files/directories into a single file known as an archive.
It does not compress data by itself; it only packs files together.

Common archive tool in Linux → tar (Tape Archive)

2. Common Use Cases
✔ Backups

Taking a complete folder backup into one archive file.

Easier to store and move.

✔ Data Transfer

Sending multiple files as one bundle.

✔ Organization

Grouping project files together.

Packaging software files.

3. Creating and Extracting Archives with tar
Create an archive
tar -cvf backup.tar /path/to/files


c → create

v → verbose (show files)

f → filename

Extract an archive
tar -xvf backup.tar


x → extract

View contents without extracting
tar -tf backup.tar

4. Managing Archive Contents
Append files to an existing tar
tar -rvf backup.tar newfile.txt

Delete a file inside an archive
tar --delete -f backup.tar unwanted.txt


🗜 Introduction to Compression
5. What is Compression?

Compression reduces file size by encoding data more efficiently.

Two types:

Lossless → No data loss (gzip, bzip2, xz)

Linux archiving + compression often works together:

tar + gzip = .tar.gz (or .tgz)

6. Role of Compression

Reduces disk usage

Faster uploads and backups

Useful for large log files, databases, source code

7. Differences Between Compression Formats
Format	   Speed	Compression Ratio	File Extension	Best For
gzip	    Fast	Medium	   .gz	General compression
bzip2	Slower	Better than gzip	.bz2	Source code, text
xz	Slowest	Highest	.xz	Maximum space saving
📌 Using Compression Tools
8. Using gzip and gunzip
Compress a file:
gzip file.txt

Decompress:
gunzip file.txt.gz

9. Using bzip2 and bunzip2
Compress:
bzip2 file.txt


Output: file.txt.bz2

Decompress:
bunzip2 file.txt.bz2

10. Using xz and unxz
Compress:
xz file.txt


Output: file.txt.xz

Decompress:
unxz file.txt.xz

🛠 Combining Archiving & Compression
11. Create Compressed tar Archives
tar + gzip
tar -czvf backup.tar.gz /folder

tar + bzip2
tar -cjvf backup.tar.bz2 /folder

tar + xz
tar -cJvf backup.tar.xz /folder

12. Extract Compressed tar Archives
Extract .tar.gz
tar -xzvf backup.tar.gz

Extract .tar.bz2
tar -xjvf backup.tar.bz2

Extract .tar.xz
tar -xJvf backup.tar.xz

⚙ Practical Examples
13. Compressing with tar, gzip, bzip2, xz
tar -czf logs.tar.gz /var/log
tar -cjf project.tar.bz2 /project
tar -cJf data.tar.xz /data

14. Decompressing with tar, gunzip, bunzip2, unxz
tar -xzf logs.tar.gz
gunzip file.gz
bunzip2 file.bz2
unxz file.xz

⏰ Introduction to CronTab (Task Scheduler)
15. What is CronTab?

CronTab allows scheduling commands/scripts to run automatically at specific times.

Examples:

Daily backups

Weekly cleanup

Automatic updates

16. Understanding CronTab Syntax

A cron job has 5 time fields:

*    *    *    *    *  command
|    |    |    |    |
|    |    |    |    └─ Day of week (0-6)
|    |    |    └───── Month (1-12)
|    |    └────────── Day of month (1-31)
|    └─────────────── Hour (0-23)
└──────────────────── Minute (0-59)


Meaning of * → every value (every minute/hour/day)

17. Creating and Managing Cron Jobs
Open crontab
crontab -e

List crontab jobs
crontab -l

Remove all cron jobs
crontab -r

18. Cron Job Examples
Run a script every day at 2 AM
0 2 * * * /home/user/backup.sh

Run a command every 5 minutes
*/5 * * * * /path/command

Run system updates every Sunday morning
0 7 * * 0 apt update && apt upgrade -y

Clean tmp folder daily at midnight
0 0 * * * rm -rf /tmp/*
