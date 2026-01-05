1. Security Group (SSH and RDP Port)
What is a Security Group?

A Security Group is a virtual firewall that controls inbound and outbound traffic to cloud instances (commonly used in AWS, Azure, GCP).

Works at instance level

Rules are stateful (if inbound is allowed, outbound response is automatically allowed)

You can allow or deny traffic based on:

Protocol (TCP, UDP, ICMP)

Port number

Source IP / CIDR

---

SSH Port (Linux Access)

Protocol: TCP

Port: 22

Purpose: Secure remote login to Linux servers

---

RDP Port (Windows Access)

Protocol: TCP

Port: 3389

Purpose: Remote Desktop access to Windows servers



Common Security Group Ports Table
Service 	Port	Protocol
SSH	        22	     TCP
RDP	        3389	 TCP
HTTP	    80	     TCP
HTTPS	    443	     TCP
MySQL	    3306	 TCP
 



What is a Key Pair?
A Key Pair is a set of two cryptographic keys used for secure authentication while accessing cloud virtual machines (instances), especially Linux servers.
It helps you log in without using a password, making access more secure.

Components of a Key Pair
A key pair consists of two keys:
1️⃣ Public Key
Stored on the cloud instance
Shared openly
Used to lock (encrypt) access


2️⃣ Private Key
Downloaded and kept with the user
Must be kept secret
Used to unlock (decrypt) access


📌 Rule:

If you lose the private key, you cannot access the instance.


Why Key Pair is Used?


Provides secure, password-less login
Prevents brute-force attacks
More secure than username/password
Mandatory for Linux instances
Used to retrieve Windows Administrator password



How Key Pair Works (Simple Explanation)

You create a Key Pair while launching an instance
Cloud stores the public key in the instance
You download the private key (.pem file)


When you connect:


Server verifies your private key
If matched → Access granted


🔐 No matching private key = No access

Key Pair Usage by OS
🔹 Linux Instance


Used directly for SSH login


ssh -i key.pem ec2-user@<Public-IP>

🔹 Windows Instance


Used to decrypt Administrator password


After decrypting, access is done using RDP



Key Pair File Types
OSFile TypeLinux / macOS.pemWindows (PuTTY).ppk

Key Pair Best Practices
✔ Never share private key
✔ Keep backup of key
✔ Restrict key file permission
chmod 400 key.pem

✔ Create separate key pairs for different environments

Real-Life Example
Think of a Key Pair like:


Public key → Lock on the door


Private key → Physical key to open it


Anyone can see the lock,
but only you have the key 🔑

One-Line Interview Answer

A key pair is a set of public and private keys used to securely authenticate and access cloud instances without using passwords.


If you want, I can also provide:


Diagram explanation


Difference between Key Pair vs Password


AWS / Azure specific explanation


