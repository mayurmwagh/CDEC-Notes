1. Introduction to Amazon S3

Amazon S3 is an object storage service provided by AWS.

It is used to store and retrieve any amount of data from anywhere on the web.
Data in S3 is stored in the form of:
Buckets → Containers for storing data
Objects → Actual files (data)

Key Features:
Highly scalable
Durability: 99.999999999% (11 9's)
Availability: High availability across regions
Security: IAM policies, bucket policies, encryption
Storage Classes: Standard, IA, Glacier, etc.

2. Create Bucket
What is a Bucket?
A bucket is a container where objects are stored.
Each bucket name must be globally unique.
Steps to Create a Bucket:
Login to AWS Console
Go to S3 service
Click Create Bucket
Enter:
Bucket name (unique)
Region
Configure:
Block Public Access (recommended ON)
Versioning (optional)
Click Create Bucket
Important Points:
Bucket name cannot be changed after creation
Region selection affects latency and cost

3. Upload Objects
What is an Object?
An object is a file + metadata stored inside a bucket.
Steps to Upload:
Open your bucket
Click Upload
Add files/folders
Set permissions (optional)
Upload
Object Components:
Key (file name)
Value (data)
Metadata
Version ID (if versioning enabled)

4. S3 Properties

S3 provides various configurable properties:

1. Storage Classes
S3 Standard (frequent access)
S3 Standard-IA (infrequent access)
S3 Glacier (archival storage)
S3 Intelligent-Tiering

2. Permissions
Bucket Policy
IAM Policy
ACL (Access Control List)

3. Encryption
SSE-S3 (default AWS encryption)
SSE-KMS (Key Management Service)
Client-side encryption

4. Lifecycle Rules
Automatically move objects between storage classes
Delete old objects

5. CORS (Cross-Origin Resource Sharing)
Allows access from different domains

5. Versioning
What is Versioning?
Keeps multiple versions of the same object in a bucket.
Benefits:
Protects against accidental deletion
Enables recovery of previous versions
States:
Enabled
Suspended
Disabled (default)
Example:
Upload file v1 → modify → upload v2 → both versions exist

6. Static Website Hosting
What is Static Website Hosting?
S3 can host static websites (HTML, CSS, JS files).
Steps:
Enable static website hosting in bucket properties
Upload:
index.html
error.html
Make bucket public (or use CloudFront)
Access via S3 website endpoint
Use Cases:
Portfolio websites
Landing pages
Documentation sites

 
 7. Server Access Logging
What is Server Access Logging?
Tracks requests made to your S3 bucket.
Logs Include:
Requester IP
Request time
Operation performed
Response status
Steps to Enable:
Go to bucket properties
Enable Server Access Logging
Specify target bucket for logs
Use Cases:
Security monitoring
Audit tracking
Usage analysis