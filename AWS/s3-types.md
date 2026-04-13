📘 Types of Storage Classes in Amazon S3
🔹 What are Storage Classes?

S3 storage classes define:

Cost
Availability
Durability
Access frequency

👉 Used to optimize storage cost based on usage pattern

🧩 1. S3 Standard

🔹 Description
Default storage class
For frequently accessed data

🔹 Features
High availability (99.99%)
High durability (99.999999999% – 11 9’s)
Stored across multiple AZs

🔹 Use Cases
Websites
Applications
Big data analytics

🧩 2. S3 Intelligent-Tiering
🔹 Description
Automatically moves data between tiers based on usage

🔹 Tiers Inside It
Frequent Access
Infrequent Access
Archive Instant Access
Archive Access
Deep Archive Access

🔹 Features
No need to manually manage lifecycle
Small monitoring fee

🔹 Use Cases
Unknown or changing access patterns

🧩 3. S3 Standard – Infrequent Access (Standard-IA)
🔹 Description
For data accessed less frequently but needed quickly
🔹 Features
Lower storage cost than Standard
Retrieval fee applicable
Multi-AZ storage
🔹 Use Cases
Backup
Disaster recovery files

🧩 4. S3 One Zone – Infrequent Access (One Zone-IA)
🔹 Description
Stored in single Availability Zone
🔹 Features
Cheaper than Standard-IA
Less resilient (AZ failure risk)
🔹 Use Cases
Re-creatable data
Secondary backups

🧩 5. S3 Glacier Instant Retrieval
🔹 Description
Archive storage with instant access
🔹 Features
Low cost
Millisecond retrieval time
🔹 Use Cases
Medical records
Media archives

🧩 6. S3 Glacier Flexible Retrieval (Earlier Glacier)
🔹 Description
Low-cost archive with flexible retrieval time
🔹 Retrieval Options
Expedited (minutes)
Standard (3–5 hours)
Bulk (5–12 hours)
🔹 Use Cases
Backup archives
Long-term storage

🧩 7. S3 Glacier Deep Archive
🔹 Description
Cheapest storage class
🔹 Features
Retrieval time: 12–48 hours
🔹 Use Cases
Compliance data
Old records