What is a Snapshot (AWS)?

An AWS Snapshot is a point-in-time backup of an EBS (Elastic Block Store) volume.
It is stored durably in Amazon S3 (managed by AWS) and used for backup, restore, and disaster recovery.

Key Characteristics


📸 Incremental Backups
First snapshot → full backup
Subsequent snapshots → only changed blocks are saved
☁️ Stored in Amazon S3 (not visible directly)
🔐 Highly durable & secure
🌍 Region-specific (can be copied to other regions)



Why Snapshots Are Used


Backup EC2 data
Restore data in case of failure
Create new EBS volumes
Create AMIs (Amazon Machine Images)
Disaster Recovery (DR)
Data migration between regions/accounts



| Feature        | Snapshot                         | EBS Volume              |
|---------------|----------------------------------|-------------------------|
| Type          | Backup                           | Live storage            |
| Location      | S3 (AWS managed)                 | Attached to EC2         |
| Cost          | Cheaper                          | More expensive          |
| Incremental   | Yes                              | No                      |


Snapshot Workflow


EC2 instance has an EBS volume
Take snapshot of EBS
Snapshot stored in S3

Use snapshot to:


Create new EBS volume
Attach to new/existing EC2
Create AMI

Deleting a snapshot:


Only removes unique blocks
Data used by other snapshots remains safe


Root volume snapshots can be used to launch new EC2 instances



| Feature            | Snapshot                  | AMI                          |
|--------------------|---------------------------|------------------------------|
| Purpose            | Backup of EBS             | Template to launch EC2       |
| Usage              | Used for storage backup   | Used to create instances     |
| Independence       | Can exist alone           | Uses snapshots internally   |


One-Line Definition (Very Important)

An AWS Snapshot is an incremental, point-in-time backup of an EBS volume stored in Amazon S3.
