1. Introduction to Load Balancer

A Load Balancer is a system (software or hardware) that distributes incoming network traffic across multiple backend servers to ensure high availability, reliability, and performance of applications.

Purpose of Load Balancer
Distributes traffic evenly across servers
Prevents server overload
Ensures high availability and fault tolerance
Improves application performance
Enables scalability

Example

If multiple users access a website at the same time, instead of sending all requests to one server, a load balancer distributes the requests across multiple servers.

2. Load Balancer Architecture
Basic Flow

Client → Load Balancer → Backend Servers

Components

1. Listener
Defines protocol and port (e.g., HTTP:80, HTTPS:443)

2. Target Group
Group of backend servers where traffic is routed

3. Routing Rules
Determines how traffic is distributed

3. Load Balancing Algorithms

1. Round Robin
Requests are distributed sequentially among servers

2. Least Connections
Traffic is sent to the server with the least active connections

3. IP Hash
Same client IP is always routed to the same server

4. Weighted Distribution
Servers are assigned weights based on capacity

4. Types of Load Balancers

4.1 Application Load Balancer (ALB)

Layer
Operates at Layer 7 (Application Layer)

Protocols
HTTP, HTTPS, WebSocket

Features
Content-based routing (URL, hostname, headers)
SSL termination
Host-based routing
Supports microservices architecture
Session persistence (sticky sessions)

Use Cases
Web applications
REST APIs
Microservices

4.2 Network Load Balancer (NLB)
Layer
Operates at Layer 4 (Transport Layer)

Protocols
TCP, UDP, TLS

Features
High performance and low latency
Can handle millions of requests per second
Provides static IP
Preserves client source IP

Use Cases
Real-time applications
Gaming systems
IoT platforms
Financial systems

4.3 Classic Load Balancer (CLB)

Layer
Works at both Layer 4 and Layer 7

Features
Basic load balancing functionality
Limited features compared to ALB and NLB
Note
Considered legacy in modern cloud environments

4.4 Gateway Load Balancer (GWLB)
Layer
Operates at Layer 3 (Network Layer)

Purpose
Used for security appliances

Use Cases
Firewall
Intrusion detection systems
Deep packet inspection


| Feature        | Application Load Balancer (ALB)       | Network Load Balancer (NLB)        |
|----------------|--------------------------------------|------------------------------------|
| OSI Layer      | Layer 7 (Application Layer)          | Layer 4 (Transport Layer)          |
| Protocols      | HTTP, HTTPS, WebSocket               | TCP, UDP, TLS                      |
| Routing Type   | Content-based (URL, Hostname, Header)| IP and Port-based                  |
| Performance    | Moderate                             | Very High                          |
| Latency        | Higher                               | Very Low                           |
| Flexibility    | High                                 | Limited                            |
| Static IP      | Not Available                        | Available                          |
| Source IP      | Not preserved by default             | Preserved                          |
| SSL Handling   | Advanced (SSL Termination)           | Basic                              |
| Use Cases      | Web apps, APIs, Microservices        | Real-time apps, Gaming, IoT        |