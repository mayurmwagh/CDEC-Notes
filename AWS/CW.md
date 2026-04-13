1. CloudWatch Dashboard

🔹 What is a Dashboard?
A CloudWatch Dashboard is a customizable visual interface.
It helps you monitor AWS resources using graphs, metrics, and widgets.

🔹 Key Features
Create multiple dashboards
Add widgets (graph, text, alarm status)
View real-time data
Cross-region visibility

🔹 Common Use Cases
Monitor EC2 CPU utilization
Track application performance
Combine multiple services in one view

🔹 Types of Widgets
Line Graph
Number
Text
Alarm Status


2. Metrics
🔹 What are Metrics?
Metrics are time-ordered data points collected from AWS services.
Automatically generated or custom-defined.

🔹 Key Points
Stored for monitoring and analysis
Each metric belongs to a namespace
Measured over time (e.g., every 1 minute)

🔹 Examples
EC2 → CPUUtilization
S3 → BucketSizeBytes
RDS → DatabaseConnections


🔹 Types of Metrics
Default AWS Metrics
Custom Metrics (user-defined)

🔹 Important Concepts
Namespace → Container for metrics
Dimensions → Key-value pairs to filter metrics
Period → Time interval (e.g., 1 min, 5 min)


3. Alarms
🔹 What is a CloudWatch Alarm?
An alarm monitors a metric and performs an action when a threshold is reached.

🔹 States of Alarm
OK → Everything normal
ALARM → Threshold breached
INSUFFICIENT_DATA → Not enough data

🔹 Key Components
Metric
Threshold value
Evaluation period
Action

🔹 Actions Triggered
Send notification (SNS)
Auto Scaling action
Stop/Terminate EC2 instance

🔹 Example
If CPU > 80% for 5 minutes → Trigger alarm → Send email

4. Logs Insights
🔹 What is Logs Insights?
A powerful tool to query and analyze logs using a query language.
🔹 Key Features
Interactive querying
Real-time log analysis
Fast search across large datasets
Visualization support
🔹 Query Language Basics
Similar to SQL-like syntax
Used to filter, sort, and aggregate logs