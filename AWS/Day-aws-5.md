1. EBS (Elastic Block Store) Volumes
What is EBS?

Amazon EBS is a block storage service designed to be used with EC2 instances.

Works like a virtual hard disk

Data persists even after instance stop

Attached to one EC2 instance at a time

Must be in the same Availability Zone as EC2

Key Features

High availability and durability

Snapshot support (backup)

Resize volume without downtime

Encrypted by default (optional KMS)

2. Types of EBS Volumes

2.1 General Purpose SSD – gp3 / gp2

Most commonly used
Balanced price & performance

Suitable for:

OS disks
Dev/Test

Small to medium applications

Type	Use
gp3	    Latest, better performance, cheaper
gp2	    Older but still used

2.2 Provisioned IOPS SSD – io1 / io2

High-performance workloads
Very high IOPS & low latency

Used for:

Databases (Oracle, MySQL, PostgreSQL)
Critical production systems

Type	Note
io2	   More durable & recommended
io1	   Older version

2.3 Throughput Optimized HDD – st1

Optimized for large sequential workloads

Used for:

Big data
Log processing
Data warehouses

❌ Not for OS or boot volume

2.4 Cold HDD – sc1

Lowest cost

Used for:

Infrequently accessed data
Archive data

❌ Not suitable for frequent access



| Volume Type | Performance       | Cost    | Use Case         |
|------------|-------------------|---------|------------------|
| gp3        | Medium            | Low     | General purpose  |
| io2        | Very High         | High    | Databases        |
| st1        | High throughput   | Medium  | Big data         |
| sc1        | Low               | Lowest  | Archive          |
