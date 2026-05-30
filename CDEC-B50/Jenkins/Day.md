Continuous Integration (CI) and Jenkins – Complete Notes
1. Introduction to CI Process (Continuous Integration)
What is Continuous Integration (CI)?

Continuous Integration (CI) is a software development practice where developers frequently merge their code changes into a shared repository. Every time code is committed, an automated pipeline builds and tests the application.

The goal of CI is to detect errors early and ensure the application always remains in a working state.

Traditional Development Process (Without CI)

In older development models:

Developers worked independently for days or weeks.
Code was merged manually.
Integration often caused conflicts and bugs.
Testing happened late in the cycle.
Problems Without CI
Merge conflicts
Undetected bugs
Delayed releases
Poor code quality
High maintenance effort



Developer Writes Code
        ↓
Push Code to Git Repository
        ↓
CI Tool Detects Change
        ↓
Build Application
        ↓
Run Automated Tests
        ↓
Generate Reports
        ↓
Notify Team


Example CI Workflow
Developer modifies Java code.
Pushes code to GitHub.
Jenkins detects the commit.
Jenkins executes mvn clean package.
Automated unit tests are executed.
Build result is reported.
Team receives success/failure notification.


Benefits of Continuous Integration
Early bug detection
Faster feedback
Better code quality
Reduced merge conflicts
Automated testing
Improved collaboration
Stable builds


Common CI Tools
Jenkins
GitHub Actions
GitLab CI/CD
CircleCI
Travis CI
TeamCity


2. Difference Between Continuous Delivery and Continuous Deployment

Continuous Delivery

Continuous Delivery ensures code is always ready for production, but deployment requires manual approval.

Code → Build → Test → Staging → Manual Approval → Production

Characteristics

Automated build and test
Automated packaging
Deployment to staging
Manual production deployment
Continuous Deployment

Continuous Deployment automatically deploys every successful change to production without human intervention.

Code → Build → Test → Production (Automatic)

Characteristics
Fully automated pipeline
No manual approval
Faster releases



Comparison Table
Feature	                 Continuous Delivery	        Continuous Deployment
Production deployment	    Manual approval	            Fully automatic
Human intervention	        Required	                Not required
Risk level	                Lower               	    Higher
Release frequency	        Frequent	                Very frequent
Suitable for	            Enterprise applications	    SaaS and web apps



Real-Life Example
Continuous Delivery

An e-commerce company prepares updates automatically, but the release manager approves deployment during low-traffic hours.

Continuous Deployment

A social media platform automatically deploys all tested changes directly to production.


What is Jenkins?

Jenkins is an open-source automation server used to implement CI/CD pipelines.

It automates:

Building applications
Running tests
Deploying applications
Sending notifications

Why Jenkins?
Open source and free
Huge plugin ecosystem
Supports distributed builds
Easy pipeline creation
Integrates with Git, Docker, Kubernetes, AWS, and more



Jenkins Architecture: 

+---------------------+
|   Developer Commit  |
+----------+----------+
           |
           v
+---------------------+
|    Jenkins Master   |
|  (Controller Node)  |
+----------+----------+
           |
   +-------+-------+
   |               |
   v               v
+------+       +------+
|Agent1|       |Agent2|
+------+       +------+



Jenkins Components
Controller (Master)
Manages jobs and pipelines
Stores configuration
Coordinates agents

Agents (Nodes)
Execute build tasks

Jobs
Configurations for automated tasks

Pipelines
Code-based workflows defined in Jenkinsfile

Plugins
Extend Jenkins functionality


Jenkins Use Cases
Java builds using Maven
Docker image creation
Kubernetes deployment
AWS infrastructure automation
Security scanning


Popular Jenkins Plugins
Git Plugin
Pipeline Plugin
Maven Integration
Docker Pipeline
Kubernetes Plugin
Email Extension Plugin


4. Install Jenkins Server
System Requirements
2 GB RAM minimum
10 GB disk space
Java 17 or newer
Linux, Windows, or macOS



Real-World CI/CD Flow Using Jenkins
Developer → GitHub → Jenkins → Build → Test → Docker Build
→ Push to Registry → Deploy to Kubernetes