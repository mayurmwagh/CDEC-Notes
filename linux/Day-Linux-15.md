Linux Search & Filter Utilities — Complete Notes
1. Introduction to Search and Filter Utilities

In Linux, working efficiently with data is essential. Large text files, logs, and directories are common, and manually searching through them is time-consuming.
Search and filter utilities help you:

Locate specific information inside files

Filter out unwanted data

Sort and display only the required output

Find files and directories based on conditions

These tools improve productivity and are core components of Linux administration.

2. Importance of Searching and Filtering Data in Linux

System Administrators often scan huge log files to identify errors.

Developers search config/code files for strings or patterns.

DevOps engineers use these utilities during automation and debugging.

Helps in fast information retrieval, saving time and reducing manual effort.

Essential in shell scripting, where automation relies heavily on accurate filtering.

3. Overview of Key Utilities: grep, cat, sort, uniq
📌 grep (Global Regular Expression Print)

Searches for specific patterns inside files.

Supports regular expressions.

Displays matching lines.

📌 cat (Concatenate)

Reads file contents.

Useful for viewing and combining files.

📌 sort

Sorts lines alphabetically or numerically.

Offers ascending, descending, numeric, unique, and reverse sorting.

📌 uniq

Removes duplicate lines.

Often used with sort because uniq only removes adjacent duplicates.

4. Read Files Using cat, uniq, and sort
cat
cat filename.txt
cat file1.txt file2.txt > merged.txt

sort
sort names.txt            # Sort alphabetically
sort -r names.txt         # Reverse order
sort -n numbers.txt       # Numeric sort
sort -u items.txt         # Sort + remove duplicates

uniq
uniq file.txt             # Remove adjacent duplicates
sort file.txt | uniq      # Proper duplicate removal
uniq -c file.txt          # Count occurrences


5. Introduction to the find Utility

find is one of the most powerful Linux commands used to search for files and directories based on:

Name

Type

Size

Time (modification, creation, access)

Ownership

Permission

It searches recursively from the given path.

6. Basic Syntax of find
find <path> <options> <expression> <action>

Breakdown:

path – where to search (/, /home, .)

options/expression – conditions (-name, -type, -size)

action – what to do (-print, -delete, -exec)

Example:

find /home -name "*.txt"

7. Advanced Usage and Filtering Options
Search by Name
find /var/log -name "syslog"
find . -iname "*.txt"      # case-insensitive

Search by Type
find . -type f             # files
find . -type d             # directories

Search by Size
find . -size +10M          # greater than 10MB
find . -size -100k         # smaller than 100KB

Search by Modification Date
find . -mtime -1           # modified within last 1 day
find . -mtime +7           # modified more than 7 days ago
find . -mmin -30           # modified in last 30 minutes

Search by Permissions
find . -perm 644
find . -perm -111          # executable files

Execute Commands with find
find . -name "*.log" -exec rm -f {} \;
find . -type f -exec ls -l {} \;

8. Practical Examples
🔹 Find files by name
find /home -name "report.pdf"
find . -iname "*.jpg"

🔹 Find directories only
find . -type d -name "backup"

🔹 Find files by size
find /var -size +50M        # logs larger than 50MB

🔹 Find recently modified files
find /etc -mtime -2         # changed in last 2 days

🔹 Find and delete files
find . -name "*.tmp" -delete

🔹 Find and list detailed information
find . -type f -exec ls -lh {} \;