Virtualization in Cloud Computing – Detailed Notes
1. What is Virtualization?

Virtualization is a technology that allows you to create multiple simulated environments or virtual machines (VMs) on a single physical hardware system.
It enables one physical server to be divided into several isolated virtual servers.

2. Why Virtualization is Important in Cloud Computing?

Virtualization is the backbone of cloud computing. It enables cloud providers (AWS, Azure, GCP) to:

Use hardware more efficiently

Run multiple operating systems on one machine

Offer flexible, scalable, on-demand resources

Reduce cost by sharing physical infrastructure

Improve speed of deployment

3. How Virtualization Works?

A software layer called a Hypervisor sits between the hardware and virtual machines.

The hypervisor:

Allocates CPU, RAM, Storage, Network resources

Keeps VMs isolated from each other

Manages creation and deletion of VMs

4. Types of Hypervisors

A. Type 1 – Bare Metal Hypervisor
Runs directly on hardware.
Examples:

VMware ESXi

Microsoft Hyper-V

KVM

B. Type 2 – Hosted Hypervisor
Runs on a host OS like Windows/Linux.
Examples:

VMware Workstation

Oracle VirtualBox

5. Types of Virtualization
1. Server Virtualization

Multiple virtual servers on one physical server.

2. Storage Virtualization

Combines multiple storage devices into one virtual storage pool.

3. Network Virtualization

Creates virtual networks (VLAN, VxLAN, SDN).

4. Desktop Virtualization

Provides virtual desktops to users (VDI).

5. Application Virtualization

Run applications without installing them on local devices.

6. Benefits of Virtualization

Cost Efficiency (less hardware required)

Scalability (create VMs instantly)

High Availability

Faster Disaster Recovery

Better Resource Utilization

Isolation (one VM does not affect another)

7. Virtualization in Cloud Service Models
IaaS (Infrastructure as a Service)

Fully depends on virtualization

Provides virtual machines, networks, storage
Examples: AWS EC2, Azure VM, GCP Compute Engine

PaaS (Platform as a Service)

Uses container-based virtualization for apps

SaaS (Software as a Service)

Runs on virtual machines managed by cloud providers

8. Virtualization vs Containers
Virtual Machines (VMs)  	Containers
Heavyweight	                Lightweight
Need full OS	            Share OS kernel
Slow to start	            Start in seconds
Use hypervisors	            Use Docker, Kubernetes

9. Real Use Cases

Hosting multiple websites on one server

Running test and development environments

Creating isolated environments for training

Disaster recovery and backup

Scalable cloud infrastructure





Virtualization vs Cloud Computing
1. Definition
Virtualization

Virtualization is a technology that creates multiple virtual environments (VMs) from a single physical machine using a hypervisor.

Cloud Computing

Cloud computing is a service delivery model that provides on-demand access to computing resources (VMs, storage, databases, networks) over the internet.

2. Purpose
Virtualization

To maximize hardware utilization

To run multiple operating systems on one physical machine

To isolate workloads

Cloud Computing

To deliver scalable IT services on demand

To reduce infrastructure cost

To offer accessibility from anywhere

3. What They Provide
Virtualization

Virtual Machines (VMs)

Virtual networks

Virtual storage

Cloud Computing

IaaS (Compute, Storage, Network)

PaaS (App platforms)

SaaS (Software applications)

4. Key Components
Virtualization Uses

Hypervisor (ESXi, Hyper-V, KVM)

Physical servers

Virtual hardware

Cloud Uses

Virtualization + Automation + API

Datacenters

Cloud platforms (AWS, Azure, GCP)

5. Dependency
Virtualization

Cloud computing uses virtualization to create virtual servers.

Cloud Computing

Cloud cannot exist without virtualization (virtual machines, storage pools, networks).

6. User Control
Virtualization

User manually manages VMs, storage, network.

Cloud Computing

User gets resources automatically:

Self-service portal

Auto-scaling

Pay-as-you-go model

7. Cost
Virtualization

High upfront hardware cost

Ongoing maintenance

Suitable for on-premise datacenters

Cloud Computing

No upfront cost

Pay only for usage

Managed by cloud provider

8. Examples
Virtualization

VMware ESXi

KVM

VirtualBox

Hyper-V

Cloud Computing

Amazon Web Services (AWS)

Microsoft Azure

Google Cloud Platform (GCP)

9. Summary Table

Feature	          Virtualization	        Cloud Computing
What it is	      Technology        	    Service Model
Purpose	          Create virtual resources	Deliver IT resources on demand
Uses	          Hypervisor	            APIs, portals + virtualization
Cost Model	      CAPEX (buy hardware)	        OPEX (pay-as-you-go)
Scalability	      Limited to hardware	    Highly scalable
Management	      Manual                      	Automated
Accessibility	  Local network         	Internet/global