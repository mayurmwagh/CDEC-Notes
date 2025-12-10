
process - 
    process is nothing but a program in execution 
    every time you open an application or you run a command you run a process 

types of process: 
    1. Foreground process:
        it ocupies the shell and we cant run another process till it previous process gets completes
        these are the process that directly intract with the terminal

    2. Background process:
        these processes run in background with out blocking your terminal 
        we can run process in backgound using & symbol 

        ctrl+z = it will stop the process 

    Jobs command:
        jobs command will list all the jobs on the system which are in running or in stopped state 
        syntax: 
            jobs

    bg and fg both are the command can be used to run stopped process but fg will bring it to the foreground and bg will 
    bring it to the background 



 1. Foreground Processes (Interactive Processes)
✔ Definition

A foreground process runs directly in the terminal/shell and occupies it until the process finishes.

✔ Characteristics

User interacts directly.

Output is displayed on the terminal.

Blocks the terminal until the task completes.

Runs normally unless paused or killed.

✔ Example
vim file.txt
python3 script.py
cat demo.txt


In all these cases, the terminal stays busy until you close/exit the program.

✔ How to stop or pause

Ctrl + C → kill/terminate

Ctrl + Z → suspend and move to stopped state

2. Background Processes (Non-Interactive Processes)
✔ Definition

Processes that run behind the scenes without blocking the terminal.

✔ Characteristics

Terminal remains free for other commands.

Output (if any) shows only when finished.

Useful for long-running operations.

Identified with the & symbol.

✔ Example
find / -name "*.log" &
ping google.com &

✔ Managing Background Jobs

List background jobs:

jobs


Bring job to foreground:

fg %1


Continue paused job:

bg %1

3. Daemon Processes (System Service Processes)
✔ Definition

Daemons are long-running background processes that start at boot and provide system-level services.

✔ Characteristics

No controlling terminal.

Runs silently in background.

Usually end with d (convention).

Managed by systemd service manager.

✔ Examples

sshd → SSH service

cron → Scheduler

httpd, nginx, mysqld

✔ View daemons
systemctl status sshd
systemctl status cron

4. Orphan Processes
✔ Definition

A process whose parent process has terminated, but the process is still running.

✔ What happens?

The init (PID 1) or systemd automatically adopts the orphan process.

Prevents uncontrolled resource usage.

✔ Example Scenario

Parent script starts a child process.

Parent script terminates unexpectedly.

Child continues running → becomes orphan.

Check adopted processes:

ps -eo pid,ppid,cmd | grep 1

5. Zombie Processes (Defunct Processes)
✔ Definition

A zombie process is a process that has completed execution, but still exists in the process table because the parent has not collected its exit status.

✔ Characteristics

Takes no system resources.

State shown as Z or <defunct>.

Indicates poor application handling.

✔ Why Zombie Occurs?

Parent process must call wait() system call.
If not, child remains zombie.

✔ Identify Zombies
ps aux | grep Z

6. Kernel Processes
✔ Definition

Processes executed in kernel space, not user space.

✔ Characteristics

Critical for OS functioning.

No associated terminal.

Often displayed inside square brackets [ ].

✔ Examples

[kthreadd]

[migration/0]

[kworker/1:0]

7. Scheduled (Batch) Jobs
✔ Definition

Tasks that run automatically at predefined times or intervals.

✔ Two main tools:

cron – recurring jobs (daily/weekly)

at – one-time scheduled jobs

Examples
cron job

Edit cron:

crontab -e


Daily task at 10 AM:

0 10 * * * /home/user/backup.sh

at job
at 5pm


(Then type commands to execute)

8. Interactive vs Non-Interactive Processes
Type	Description	Example
Interactive	Requires user input	vim, nano
Non-Interactive	Runs automatically	cron job, script
9. System Processes vs User Processes
System Processes

Started by kernel/OS

Critical services (cron, sshd)

User Processes

Started by logged-in users

Applications, scripts

10. Job Types in Shell (Job Control)

Linux shell allows controlling processes as jobs.

Types of Jobs
Job Type	Description
Running Job	Actively executing
Stopped Job	Suspended using Ctrl+Z
Background Job	Running but not blocking terminal
Foreground Job	Running and blocking terminal
Job commands

jobs → list jobs

fg %1 → bring job to foreground

bg %1 → run job in background



✅ Difference Between top, htop, and jobs Commands

1. top Command
What it is:

A real-time system monitoring tool available by default on all Linux systems.

Displays running processes and system resource usage.

What it shows:

CPU usage

Memory usage

Running processes

Load average

Process IDs (PID), user, priority, etc.

Interface:

Text-based, simple, not interactive (limited key controls)

Use Case:

Quickly check system performance

Monitor resource-heavy processes

Example:
top

2. htop Command
What it is:

An improved, interactive version of top.

Not installed by default (you must install it).

What it shows:

Detailed visual bars for CPU, memory, and swap usage

Color-coded process list

Tree view of processes

Easily sort and filter processes

Interface:

Highly interactive

Supports mouse control

Easier navigation and process killing

Use Case:

Advanced monitoring

Visual representation of system load

Easy process management (kill, renice with one click)

Example:
htop

3. jobs Command
What it is:

A shell built-in command, not a system monitor.

Shows background and suspended jobs in the current terminal session only.

What it shows:

Jobs started by the current shell using:

& (background)

Ctrl+Z (suspend)

Interface:

Simple output

Not interactive

Only used for shell job control

Use Case:

Manage background tasks in the same terminal

Bring jobs to foreground/background using:

fg

bg

Example:
jobs



states of process 
    - running (R)
    - stopped (T)
    - sleeping (s)
    - zombie (Z)
    - orphan (0)

    ps -elf 
    ps -aux
    ps aux


📘 Fields of the top Command (with Meaning)

When you run top, it displays system summary at the top and per-process fields below.
Here are the important fields your students must know clearly.

1. System Summary Fields (Top Section)
a) uptime line

Example:

top - 14:22:12 up 2 days,  3:18,  2 users,  load average: 0.45, 0.60, 0.55

Field	            Description
current time	    System time
up	                System uptime
users	            Logged-in users
load average	    CPU load for last 1, 5, 15 minutes

b) Tasks
Tasks: 215 total, 1 running, 214 sleeping, 0 stopped, 0 zombie

Field               Meaning
total	            Total processes
running	            Actively executing
sleeping	        Waiting for an event
stopped	            Paused by signal
zombie	            Dead process awaiting cleanup

c) CPU Usage
%Cpu(s):  5.0 us,  3.0 sy,  0.0 ni, 90.0 id, 1.0 wa, 0.0 hi, 1.0 si, 0.0 st

Field	        Meaning
us	            User CPU usage
sy	            System (kernel) usage
ni	            Nice value usage
id	            Idle CPU
wa	            Waiting for I/O
hi	            Hardware interrupts
si	            Software interrupts
st	            CPU stolen by hypervisor (VMs)

d) Memory Usage
MiB Mem :  7845.3 total, 1432.6 free, 2980.2 used, 3432.5 buff/cache

Field	        Meaning
total	        Total RAM
free	        Completely unused RAM
used	        Actively used by processes
buff/cache	    Buffers + cache (used by OS but reusable)

e) Swap Usage
MiB Swap:  2047.0 total, 2047.0 free, 0 used

Field	Meaning
total	Total swap space
free	Unused swap
used	Swap in use

2. Per-Process Fields (Process Table Section)

Below are the most important process table columns shown in top:

Column	        Field Name      	Description
PID	            Process ID	        Unique ID of the process
USER	        User            	Owner of the process
PR	            Priority	        Scheduling priority of process
NI	            Nice value      	Range: -20 to +19
VIRT	        Virtual Memory	    Total virtual memory used by process
RES	            Resident Memory	    Physical RAM consumed
SHR	            Shared Memory	    Amount of shared memory
S           	State	            Running (R) / Sleeping (S) / Stopped (T) / Zombie (Z)
%CPU	        CPU Usage	        Percentage of CPU used by the process
%MEM	        Memory Usage	    Percentage of RAM used
TIME+	        CPU Time	        Total CPU time consumed by the process
COMMAND	        Command	            Name of the executable/process

State Values (S Column)
Code	Meaning
R	Running
S	Sleeping
T	Stopped
Z	Zombie
D	Uninterruptible sleep (usually I/O)

Summary for Students

top helps you see CPU, Memory, Processes.
Key columns: PID, PR, NI, %CPU, %MEM, TIME+, COMMAND.
Helps identify high resource usage processes.


renice -n 10 1060 