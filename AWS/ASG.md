Horizontal Scaling vs Vertical Scaling 

Scaling is the process of increasing system capacity to handle more load. There are two main types:

1. Horizontal Scaling
2. Vertical Scaling

1. Horizontal Scaling
    
    Definition
    Horizontal scaling means adding more machines (servers/instances) to distribute the load.

    How it works
    If traffic increases → add more servers
    If traffic decreases → remove servers
    Typically used with load balancers

    Advantages
    High availability
    Fault tolerance (if one server fails, others work)
    Better for large-scale applications
    No downtime required

    Disadvantages
    Complex setup (load balancer, distributed system)
    Data consistency challenges

    Real-world Use Cases
    Cloud platforms like Amazon Web Services
    Microservices architecture
    High-traffic websites (e.g., e-commerce)



2. Vertical Scaling (Scale Up / Scale Down)

    Definition

    Vertical scaling means increasing the power of a single machine (CPU, RAM, storage).
    
    How it works
    Upgrade server capacity
    Example:
    2 CPU → 8 CPU
    4 GB RAM → 32 GB RAM

    Advantages
    Simple to implement
    No major architecture changes
    Good for small applications

    Disadvantages
    Limited by hardware capacity
    Downtime required (in most cases)
    Single point of failure

    Real-world Use Cases
    Small applications
    Databases initially hosted on a single server
    Legacy systems




1. Auto Scaling and Its Types
    What is Auto Scaling?

    Auto Scaling is a cloud computing feature that automatically adjusts the number of compute resources (like EC2 instances in AWS) based on demand.

    It helps:

    Maintain application availability
    Handle traffic spikes
    Reduce cost by removing unused resources


    Types of Auto Scaling
    1. Manual Scaling
        User manually adjusts instance count
        No automation involved

        Use Case: Testing or small environments

    2. Dynamic Scaling

    Automatically adjusts capacity based on demand.

        a) Target Tracking Scaling
        Maintains a specific metric value
        Example: Keep CPU utilization at 50%

        b) Step Scaling
        Scaling based on thresholds
        Example:
        CPU > 70% → add 2 instances
        CPU > 90% → add 4 instances
        
        c) Simple Scaling
        Basic scaling with cooldown period
        Less commonly used now
    
    3. Scheduled Scaling
        Scaling based on time schedule
        Example:
        Increase instances at 9 AM
        Decrease at 6 PM
    
    4. Predictive Scaling
        Uses machine learning
        Predicts future traffic patterns
        Scales in advance

    Advantages of Auto Scaling
        High availability
        Cost optimization
        Fault tolerance
        Better performance handling