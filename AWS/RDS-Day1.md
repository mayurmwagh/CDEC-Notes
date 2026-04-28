# Database & Amazon RDS Notes

---

## 1. Relational Database (RDBMS)

A **Relational Database** stores data in structured tables (rows and columns). Relationships between data are maintained using keys.

### Key Characteristics
- Structured data format (tables)
- Predefined schema (fixed structure)
- Supports relationships using:
  - **Primary Key**
  - **Foreign Key**
- Uses **SQL (Structured Query Language)**
- Ensures **ACID properties** (Atomicity, Consistency, Isolation, Durability)

### Examples
- MySQL
- PostgreSQL
- Oracle Database
- Microsoft SQL Server

---

## 2. Non-Relational Database (NoSQL)

A **Non-Relational Database (NoSQL)** stores data in flexible, non-tabular formats such as JSON, key-value, graph, or document-based structures.

### Key Characteristics
- Schema-less (no fixed structure)
- Handles unstructured and semi-structured data
- Highly scalable (horizontal scaling)
- Optimized for large-scale distributed systems
- Follows **eventual consistency** (not strict ACID)

### Types of NoSQL Databases
- **Key-Value Stores**
- **Document Databases**
- **Column-Based Databases**
- **Graph Databases**

---

## 3. Introduction to DBMS

A **Database Management System (DBMS)** is software used to store, manage, and retrieve data efficiently.

### Functions
- Data storage and retrieval
- Data security
- Data integrity maintenance
- Multi-user access control

### Types of DBMS
- Hierarchical DBMS
- Network DBMS
- Relational DBMS (RDBMS)
- NoSQL DBMS

### Examples
- MySQL
- Oracle Database
- Microsoft SQL Server

---

## 4. Introduction to SQL

**SQL (Structured Query Language)** is used to interact with relational databases.

### Uses
- Creating databases and tables
- Inserting, updating, deleting data
- Retrieving data using queries

### Types of SQL Commands

#### DDL (Data Definition Language)
- `CREATE`
- `ALTER`
- `DROP`

#### DML (Data Manipulation Language)
- `INSERT`
- `UPDATE`
- `DELETE`

#### DQL (Data Query Language)
- `SELECT`

---

## 5. Introduction to MariaDB

**MariaDB** is an open-source relational database system and a fork of MySQL.

### Features
- High performance
- Open-source and free to use
- Compatible with MySQL
- Widely used in web applications

### Advantages
- Faster than MySQL in many scenarios
- Additional storage engines
- Strong community support

### Use Cases
- Web applications (CMS, e-commerce)
- Backend data storage
- Data warehousing

---

## 6. Introduction to Amazon RDS

**Amazon RDS (Relational Database Service)** is a managed database service provided by AWS that simplifies database operations in the cloud.

### Key Features
- Fully managed service
- Automates:
  - Backups
  - Software patching
  - Monitoring
  - Scaling

### Supported Database Engines
- MySQL
- PostgreSQL
- MariaDB
- Oracle Database
- Microsoft SQL Server

### Purpose
Eliminates the need to manually install and manage databases on servers.

---

## 7. Advantages of Amazon RDS

### Fully Managed Service
- No infrastructure management required
- Automatic updates and patching

### Automated Backups
- Daily backups
- Transaction logs
- Point-in-time recovery

### Scalability
- Vertical scaling (CPU, RAM)
- Storage auto-scaling

### Security
- Runs inside VPC
- Encryption at rest and in transit
- IAM-based access control

### High Availability
- Multi-AZ deployment
- Automatic failover

### Monitoring
- Integration with CloudWatch
- Performance Insights

### Cost Efficiency
- Pay-as-you-go pricing
- No upfront hardware cost

---