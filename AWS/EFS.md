What is Amazon EFS?

Amazon Elastic File System (EFS) is a fully managed, scalable, shared file storage service provided by AWS for Linux-based workloads.
Works like a network file system (NFS)
Can be mounted simultaneously on multiple EC2 instances
Automatically grows and shrinks as data is added or removed

Key Characteristics of EFS
1. Fully Managed

No need to manage servers, disks, or capacity

AWS handles:

Storage provisioning
Scaling
High availability
Maintenance

2. Elastic & Scalable

Storage automatically scales:

From KBs to Petabytes
No pre-allocation required
Pay only for used storage

3. Shared File System

Multiple EC2 instances can access the same data at the same time

Ideal for:

Shared application files
Web content
Logs

User home directories

4. Linux-Based File System

Uses NFS v4.1 / v4.0
Works only with Linux EC2 instances
Not supported natively on Windows
EFS Architecture
Regional Service
EFS is regional
Data is stored across multiple Availability Zones (AZs)
High availability and fault tolerance by default
Mount Targets
You must create mount targets in each AZ
EC2 instances connect to EFS via mount targets
Uses Security Groups for access control
EFS Performance Modes

1. General Purpose (Default)

Low latency

Suitable for:

Web servers
CMS
Dev/Test
Microservices

2. Max I/O

Higher throughput
Slightly higher latency

Suitable for:

Big data
Media processing
Analytics workloads

Throughput Modes

1. Bursting Throughput (Default)

Throughput scales with storage size

Best for:

Spiky workloads

2. Provisioned Throughput

Manually set throughput
Independent of storage size

Best for:

Small file systems with high throughput needs

3. Elastic Throughput (Newer Option)

Automatically scales throughput
No manual provisioning
Best for unpredictable workloads

EFS Storage Classes

1. Standard

Frequently accessed data
Higher cost
Low latency

2. Infrequent Access (EFS-IA)

Lower cost
Slightly higher latency
Lifecycle policies move data automatically

3. Archive (Lowest Cost)

For rarely accessed data
Retrieval takes longer
Ideal for long-term storage
EFS Lifecycle Management
Automatically moves files between:
Standard → IA → Archive
Based on last access time
Reduces storage cost

Security in EFS
1. Network Security

Controlled using Security Groups
Uses NFS port 2049

2. Encryption

At rest – Enabled using AWS KMS
In transit – TLS encryption supported

3. IAM Integration

IAM controls:
Who can create/delete EFS
File-level permissions use Linux POSIX permissions

Backup & Protection
AWS Backup Integration
Automatic backups supported
Point-in-time recovery
Replication
Supports EFS replication to another region

Used for disaster recovery

| Feature     | EFS            | EBS           | S3                     |
|------------|----------------|---------------|------------------------|
| Type       | File           | Block         | Object                 |
| Shared     | Yes            | No            | Yes                    |
| OS Support | Linux only     | Linux/Windows | All                    |
| Scaling    | Automatic      | Manual        | Automatic              |
| Use Case   | Shared storage | OS & Database | Static files
