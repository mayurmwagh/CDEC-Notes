# # Hosted Zone 

A Hosted Zone is a collection of DNS records (like A, CNAME, MX, etc.) for a domain such as example.com, which tells the internet how to route traffic for that domain.

Example

If you have a domain mywebsite.com, the hosted zone will contain records like:

A Record → points domain to an IP (e.g., your server)

CNAME Record → redirects one domain name to another
MX Record → handles email routing
TXT Record → used for verification, security (SPF, DKIM)


Types of Hosted Zones

Public Hosted Zone
Used for domains accessible over the internet
Example: google.com, amazon.com

Private Hosted Zone
Used within a VPC (Virtual Private Cloud)
Not accessible from the internet
Used for internal applications (e.g., internal.company.local)

Key Points
Each domain in Route 53 must have a hosted zone
Hosted zone contains Name Servers (NS records) automatically created
These NS records must be updated at your domain registrar
Hosted zone is where you manage all DNS configurations
Real-World Analogy

Think of a hosted zone like a phone directory for your domain:

Domain = Your company name
Hosted Zone = Contact list
DNS Records = Individual phone numbers


# Routing Policies 

In Amazon Route 53, a Routing Policy defines how DNS queries are answered—basically, how traffic is directed when someone tries to access your domain.

Instead of always returning the same IP address, routing policies let you control which resource (server, load balancer, region, etc.) should respond based on different conditions.

Why Routing Policies are Important

They help in:

Load balancing traffic
Improving application availability
Disaster recovery
Reducing latency for users
Types of Routing Policies in Route 53

1. Simple Routing Policy
Default and basic routing
Returns a single record (or multiple randomly)
No special logic applied

👉 Use when you have only one server or endpoint

2. Weighted Routing Policy
Splits traffic based on assigned weights
Example:
Server A → 70% traffic
Server B → 30% traffic

👉 Useful for:

Testing new versions (A/B testing)
Gradual deployments
3. Latency-Based Routing
Routes user to the lowest latency (closest) region
Improves performance

👉 Example:
User from India → AWS Mumbai region
User from US → AWS Virginia region

4. Failover Routing Policy
Used for high availability
Has:
Primary server
Secondary (backup) server
Automatically switches if primary fails

👉 Requires health checks

5. Geolocation Routing
Routes traffic based on user location (country/continent)

👉 Example:
India users → Indian server
Europe users → EU server

6. Geoproximity Routing (Advanced)
Routes based on geographic location + bias (traffic shifting)
Requires Route 53 Traffic Flow

👉 Used when you want fine control over traffic distribution

7. Multi-Value Answer Routing
Returns multiple healthy IPs
Works like basic load balancing

👉 Improves availability without complex setup



# Diffrent types of records

1. A Record (Address Record)

Maps a domain name to an IPv4 address
Example:
example.com → 192.168.1.1

👉 Most commonly used record

2. AAAA Record
Maps a domain to an IPv6 address
Example:
example.com → 2400:cb00:2048:1::c629:d7a2
3. CNAME (Canonical Name)
Maps one domain to another domain
Example:
www.example.com → example.com

👉 Used for domain redirection

4. MX Record (Mail Exchange)
Defines mail servers for your domain
Example:
example.com → mail.google.com

👉 Required for email services

5. TXT Record
Stores text information
Used for:
Domain verification
SPF, DKIM (email security)

👉 Example:
"v=spf1 include:_spf.google.com ~all"

6. NS Record (Name Server)
Specifies authoritative name servers
Automatically created in hosted zone

👉 Connects your domain to Route 53

7. SOA Record (Start of Authority)
Contains admin info about domain
Includes:
Primary DNS server
Email of admin
Refresh settings

👉 Managed automatically

8. PTR Record (Reverse DNS)
Maps IP address → domain name
Example:
192.168.1.1 → example.com

👉 Used in email verification & logging

9. SRV Record (Service Record)
Defines location of specific services
Example:
Used for VoIP, chat apps

👉 Contains port number, priority

10. CAA Record (Certification Authority Authorization)
Specifies which Certificate Authorities can issue SSL certificates for your domain

👉 Improves security

11. Alias Record (AWS Specific)
Used in Route 53 instead of CNAME for AWS resources
Can point to:
S3 bucket
Load Balancer
CloudFront

👉 Advantage:

Works at root domain (CNAME cannot)