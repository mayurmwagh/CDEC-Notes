Amazon EC2 (Elastic Compute Cloud)

1. EC2 Dashboard – Complete Explanation

The EC2 Dashboard is the main control panel used to view, launch, and manage virtual servers (instances) in AWS.

1.1 Key Sections of EC2 Dashboard
1. Instances

Virtual machines running in AWS

Shows:

Instance ID

Instance type

State (running, stopped, terminated)

Public/Private IP

Availability Zone

Actions:

Start / Stop / Reboot / Terminate

Connect via SSH (Linux) or RDP (Windows)

Create AMI

Change instance type

2. Instance Types (Brief Explanation)

EC2 Instance Types define the CPU, RAM, storage, and network performance of an EC2 instance. AWS provides different instance families to match different workload requirements.

a) General Purpose

Balanced CPU, memory, and networking
Suitable for most common workloads
Examples: t3, t4g, m5
Use cases:

Web servers
Application servers
Development and testing

b) Compute Optimized

High CPU performance
Best for compute-intensive applications
Examples: c5, c6

Use cases:

Batch processing
High-performance web servers
Scientific calculations

c) Memory Optimized

Large RAM capacity
Designed for memory-intensive workloads
Examples: r5, x1

Use cases:

Databases
In-memory caching (Redis, Memcached)
Big data analytics

d) Storage Optimized

High disk I/O and throughput
Ideal for data-intensive applications
Examples: i3, d2

Use cases:

Data warehousing
Log processing
NoSQL databases

e) Accelerated Computing

Uses GPU, FPGA, or ML accelerators
Designed for high-performance computing
Examples: p3, g4

Use cases:

Machine learning & AI
Graphics rendering
Video processing



Quick Summary

General purpose → Balanced workloads

Compute optimized → CPU heavy

Memory optimized → RAM heavy

Storage optimized → Disk heavy

Accelerated computing → GPU/AI workloads



3. AMIs (Amazon Machine Images)

Template used to launch instances

Contains:

OS

Application software

Configuration

Types:

AWS provided

Marketplace AMIs

Custom AMIs

4. Key Pairs

Used for secure login

Private key (.pem) for Linux

Required at instance launch

5. Security Groups

Virtual firewall for instances

Controls inbound and outbound traffic

Example rules:

SSH (22)

HTTP (80)

HTTPS (443)

RDP (3389)

6. Elastic IPs

Static public IP addresses

Used when instance IP should not change

7. Volumes (EBS)

Persistent block storage

Attached to instances

Types:

gp3, gp2, io1, st1, sc1

8. Snapshots

Backup of EBS volumes

Stored in S3

Used to create new volumes or AMIs

9. Placement Groups

Controls how instances are placed on hardware

Types:

Cluster

Spread

Partition


3. Status Checks and AMI
3.1 EC2 Status Checks

EC2 Status Checks – Explained with 1/2 & 2/2

AWS EC2 performs two health checks on every instance:

System Status Check

Instance Status Check

The result is shown as x/2.

✅ 2/2 Status Checks Passed

Meaning:
Both checks are healthy.

System Status Check ✔

Instance Status Check ✔

Result:
🟢 Instance is running normally
No action required.

⚠️ 1/2 Status Checks Passed

Meaning:
One check has failed.

Case 1: System Check Failed (1/2)

AWS infrastructure issue

Hardware / network / power problem

Action:

Stop & Start the instance

Contact AWS Support if required

Case 2: Instance Check Failed (1/2)

OS or application issue

High CPU / memory

Disk full / OS crash

Action:

Reboot the instance

Check system logs

Fix OS or application issues

❌ 0/2 or 2/2 Status Checks Failed

(Both checks failed)

Meaning:

Severe issue with infrastructure + OS

Action:

Stop & Start instance immediately

Recover from snapshot / AMI if needed

Contact AWS Support

📌 Quick Summary Table
Status	       Meaning	                    Responsibility	            Action
2/2	           Fully Healthy	              AWS + Customer        	None
1/2(System)    Infra Issue      	          AWS	                    Stop/Start
1/2 (Instance)	OS Issue	                  Customer	                Reboot / Fix OS
0/2	            Critical Failure	          AWS + Customer	        Recover / Support

4. Launch Templates

A Launch Template is a reusable configuration used to launch EC2 instances.

Contains:

AMI ID

Instance type

Key pair

Security group

Storage configuration

User data (startup script)

Benefits:

Consistency

Faster instance launch

Used in Auto Scaling Groups

Difference: Launch Template vs Launch Configuration
Feature                     Launch Template	    Launch Configuration
Versioning	                     Yes	                    No
Multiple instance types	         Yes    	                No
Recommended	                     Yes                	Deprecated



5. EC2 Purchasing Options

AWS provides multiple purchasing models to optimize cost, flexibility, and compliance based on workload requirements.

5.1 On-Demand Instances

Description

Pay for compute capacity per second (Linux) or per hour (Windows)
No upfront payment
No long-term commitment

Key Features

Start and stop instances anytime
Full flexibility
Highest cost compared to other options

Use Cases

Short-term workloads
Development and testing environments
Unpredictable traffic
Proof of concepts (POC)

Example

Running a temporary EC2 instance for testing an application for 2–3 hours.

5.2 Reserved Instances (RI)
Description

Commit to EC2 usage for 1 year or 3 years
Provides up to 75% cost savings compared to On-Demand
Payment Options
No upfront
Partial upfront
All upfront (maximum discount)

Types of Reserved Instances
a) Standard Reserved Instances

Highest discount
Fixed instance family, type, region
Limited modification
Best for steady, predictable workloads

b) Convertible Reserved Instances

Slightly lower discount
Can change:
Instance family
Instance type

OS

Ideal for workloads that may evolve
Use Cases
Long-running applications
Production environments
Databases and backend services

5.3 Savings Plans ⭐ (Recommended)
Description

Commit to a specific hourly spend (e.g., $10/hour)
Flexible across:
Instance types
Instance sizes
Availability Zones
Provides up to 72% savings

Types

Compute Savings Plan (most flexible)
EC2 Instance Savings Plan (specific family)
Why AWS Recommends Savings Plans
More flexible than Reserved Instances
Automatically applies discounts
Easier to manage

Use Cases

Long-term workloads with changing instance types
Organizations scaling or migrating frequently

5.4 Spot Instances
Description

Uses unused AWS capacity
Up to 90% cheaper than On-Demand
AWS can terminate instance with 2-minute notice
Key Characteristics
Not guaranteed availability
Best used with Auto Scaling or Spot Fleet

Use Cases

Batch processing
Big data analytics
CI/CD jobs
Fault-tolerant and stateless applications

Not Suitable For

Critical production systems
Databases
Applications requiring continuous uptime

5.5 Dedicated Hosts / Dedicated Instances
Description

Physical EC2 server dedicated to a single AWS customer
Full visibility and control over hardware
Dedicated Host

Control over:

CPU sockets
Cores
Host placement
Supports BYOL (Bring Your Own License)
Dedicated Instance
Runs on dedicated hardware
No control over physical server

Use Cases
Regulatory compliance
Licensing requirements (Oracle, Windows Server)
Security-sensitive workloads

## Quick Comparison Summary

| Option        | Cost      | Commitment | Flexibility | Best For                  |
|---------------|-----------|------------|-------------|---------------------------|
| On-Demand     | High      | None       | Very High   | Short-term workloads     |
| Reserved      | Low       | 1–3 Years  | Medium      | Stable workloads         |
| Savings Plans | Low       | 1–3 Years  | High        | Long-term flexible usage |
| Spot          | Very Low  | None       | Low         | Batch jobs               |
| Dedicated     | Highest   | Optional   | Low         | Compliance requirements  |





