1. Relational Database (RDBMS)

A relational database stores data in the form of tables (rows and columns), and relationships between data are maintained using keys.

Key Characteristics:
    Data is stored in structured format (tables)
    Uses predefined schema (fixed structure)
    Supports relationships using:
        Primary Key
        Foreign Key
    Uses SQL (Structured Query Language) for operations
    Ensures data integrity and consistency (ACID properties)
Examples:
    MySQL
    PostgreSQL
    Oracle Database
    Microsoft SQL Server

2. Non-Relational Database (NoSQL)

A non-relational database stores data in a flexible, non-tabular format such as JSON, key-value, graph, or document-based.

Key Characteristics:
    Schema-less (no fixed structure)
    Can handle unstructured and semi-structured data
    Highly scalable (horizontal scaling)
    Faster for large-scale distributed systems
    Does not strictly follow ACID (often uses eventual consistency)
    
Types of NoSQL Databases:
    Key-Value Stores
    Document Databases
    Column-Based Databases
    Graph Databases

Amazon RDS & Database Fundamentals Notes

1. Introduction to Amazon RDS

Amazon RDS (Relational Database Service) is a managed database service provided by Amazon Web Services that simplifies the setup, operation, and scaling of relational databases in the cloud.

Key Points:
Fully managed service
Automates routine tasks such as:
    Backups
    Software patching
    Monitoring
    Scaling
Supports multiple database engines:
    MySQL
    PostgreSQL
    MariaDB
    Oracle Database
    Microsoft SQL Server

Purpose:

RDS removes the need to manually install and manage databases on servers.

2. Advantages of RDS

Fully Managed Service
    No need to manage infrastructure
    Automatic updates and patching

Automated Backups
    Daily backups and transaction logs
    Point-in-time recovery support
Scalability
    Vertical scaling (CPU and RAM)
    Storage auto-scaling
Security
    Runs inside VPC
    Encryption at rest and in transit
    IAM integration for access control
High Availability
    Multi-AZ deployments
    Automatic failover
Monitoring
    Integration with CloudWatch
    Performance Insights support
Cost Efficiency
    Pay-as-you-go pricing
    No hardware investment required

3. Introduction to DBMS

DBMS (Database Management System) is software used to store, manage, and retrieve data efficiently.

Examples:
    MySQL
    Oracle Database
    Microsoft SQL Server
Functions:
    Data storage and retrieval
    Data security
    Data integrity maintenance
    Multi-user access control
Types of DBMS:
    Hierarchical DBMS
    Network DBMS
    Relational DBMS (RDBMS)
    NoSQL DBMS

4. Introduction to SQL

SQL (Structured Query Language) is used to interact with relational databases.

Uses:
    Creating databases and tables
    Inserting, updating, deleting data
    Retrieving data using queries
Types of SQL Commands:

DDL (Data Definition Language)
    CREATE
    ALTER
    DROP
DML (Data Manipulation Language)
    INSERT
    UPDATE
    DELETE
DQL (Data Query Language)
    SELECT


5. Introduction to MariaDB

MariaDB is an open-source relational database system and a fork of MySQL.

Features:
    High performance
    Open-source and free to use
    Compatible with MySQL
    Widely used in web applications
Advantages:
    Faster performance compared to MySQL in many scenarios
    Additional storage engines
    Strong community support
Use Cases:
    Web applications (e.g., CMS, e-commerce)
    Backend data storage
    Data warehousing