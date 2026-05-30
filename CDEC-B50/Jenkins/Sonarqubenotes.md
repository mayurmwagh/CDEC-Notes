What is SonarQube?

SonarQube is a code quality and security testing tool used to analyze source code for:

Bugs
Vulnerabilities
Code smells
Duplicate code
Security issues
Maintainability problems
Test coverage

It supports multiple programming languages such as:

Java
Python
JavaScript
C/C++
PHP
Go
Kotlin
TypeScript
Terraform and more


Why SonarQube is Used

Main Purposes

Feature	                        Description
Static Code Analysis	    Checks code without executing it
Security Testing	        Finds vulnerabilities and security hotspots
Code Quality	            Detects bad coding practices
CI/CD Integration	        Works with Jenkins, GitHub Actions, GitLab CI
Quality Gates	            Stops deployment if quality fails
Technical Debt Tracking	    Measures maintainability issues



Components
SonarQube Server
Web dashboard
Stores reports
Sonar Scanner
Scans source code
Sends report to server
Database
Stores project analysis data

CI/CD Tool
Jenkins/GitHub/GitLab trigger scans automatically


Basic Workflow

Developer Code
       ↓
Sonar Scanner Runs
       ↓
Code Analysis Happens
       ↓
Report Sent to SonarQube Server
       ↓
Dashboard Displays Issues



Important Concepts
Concept             	Meaning
Bug	Code issue          causing wrong behavior
Vulnerability	        Security weakness
Code Smell	            Bad coding practice
Quality Gate	        Pass/Fail condition
Coverage	            Percentage of tested code
Technical Debt	        Effort needed to fix code issues


Advantages
Improves code quality
Enhances security
Easy CI/CD integration
Supports many languages
Central dashboard
Automated quality checks

Limitations
Large projects need more resources
Advanced features need Enterprise edition
False positives possible sometimes


Main Categories of Metrics
Category	        Purpose
Reliability	        Detect bugs
Security	        Detect vulnerabilities
Maintainability	    Detect code smells & technical debt
Coverage	        Measure test coverage
Duplications	    Detect duplicate code
Complexity	        Measure code complexity
Size	            Count LOC, files, classes
Issues	            Total issues detected
Quality Gates	    Pass/Fail quality conditions

1. Reliability Metrics (Bugs)

These metrics identify coding errors that may cause application failures.

Metric	                    Description
Bugs	                    Total number of bugs
New Bugs	                Bugs added in new code
Reliability Rating	        A–E rating based on bug severity
Reliability Remediation     Effort	Time required to fix bugs

Reliability Rating Scale

Rating	        Meaning
A	            No bugs
B	            Minor bugs
C	            Major bugs
D           	Critical bugs
E	            Blocker bugs