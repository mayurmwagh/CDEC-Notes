# AWS CloudFront – Study Notes

## 1. What is CloudFront?

Amazon CloudFront is a Content Delivery Network (CDN) service provided by AWS.

It is used to:
- Deliver content (websites, APIs, videos, images) with low latency  
- Improve performance using edge locations  
- Enhance security and scalability  

---

## 2. Key Concept: CDN (Content Delivery Network)

A CDN is a network of servers distributed globally.

### How it works:
1. User requests content (e.g., website)  
2. Request goes to nearest edge location  
3. If content is cached → served immediately  
4. If not cached → fetched from origin (S3/EC2) and then cached  

---

## 3. Important Components of CloudFront

### 1. Distribution
- Main configuration unit in CloudFront  
- Defines how content is delivered  

**Types:**
- Web Distribution (HTTP/HTTPS)  
- RTMP (for streaming – now deprecated in most cases)  

---

### 2. Origin
The source of your content.

**Examples:**
- Amazon S3 (static website)  
- Amazon EC2 (dynamic content)  
- Load Balancer  
- Any external server  

---

### 3. Edge Locations
- AWS data centers worldwide  
- Store cached content closer to users  

---

### 4. Cache Behavior

Controls:
- Path pattern (e.g., `/images/*`)  
- Caching rules  
- Allowed HTTP methods  

---

## 4. CloudFront Workflow

1. User opens website  
2. DNS routes request to nearest edge location  
3. Edge location checks cache  
   - If cached → return response  
   - If not → fetch from origin  
4. Content delivered to user and cached  

---

## 5. CloudFront + S3 Integration (Very Important)

### Use Case: Hosting Static Website

**Steps:**
1. Create S3 bucket  
2. Upload static files (HTML, CSS, JS)  
3. Enable static website hosting (optional)  
4. Create CloudFront distribution  
5. Set S3 as origin  
6. Access via CloudFront URL  

### Benefits:
- Faster content delivery  
- Global availability  
- Reduced load on S3  

---

## 6. Caching in CloudFront

### What is Caching?
Storing frequently accessed content at edge locations.

### Key Terms:
- **TTL (Time To Live)** → cache duration  
- **Cache Hit** → content served from cache  
- **Cache Miss** → fetched from origin  

---

## 7. Security Features

### 1. HTTPS Support
- SSL/TLS encryption  

### 2. AWS Shield
- Protection against DDoS attacks  

### 3. AWS WAF (Web Application Firewall)
- Protect against SQL injection, XSS  

### 4. Signed URLs / Cookies
- Restrict content access  

---

## 8. Pricing Concept

CloudFront charges based on:
- Data transfer out  
- Number of requests  

---

## 9. Advantages of CloudFront

- Low latency (fast content delivery)  
- High availability  
- Secure (WAF + Shield)  
- Scalable automatically  
- Cost-efficient for global users  

---