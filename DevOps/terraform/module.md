Terraform Module Concept (Detailed Explanation)

A module in Terraform is a reusable container of Terraform configuration files that groups related resources together.

In simple terms:

A module is a package of Terraform code that can be reused multiple times with different inputs.

1. Why Modules Are Needed

When managing infrastructure, you often create the same types of resources repeatedly.

Examples:

Amazon Web Services VPCs for dev, test, and production
Subnets and route tables
EC2 instances
Security groups

Without modules, you would copy and paste the same Terraform code many times.

Problems with copy-paste:

Duplicate code
Hard to maintain
Greater chance of mistakes
Difficult to standardize

Modules solve this by allowing you to write the code once and reuse it.