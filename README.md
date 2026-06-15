# AWS Three-Tier Architecture with Terraform & CI/CD

## Project Overview

This project demonstrates the deployment of a highly available AWS Three-Tier Architecture using Terraform Infrastructure as Code (IaC). The environment consists of a public-facing Application Load Balancer (ALB), EC2 application server, private networking components, and an Amazon RDS database.

The project was developed to strengthen practical cloud engineering, networking, Terraform, and DevOps skills while simulating real-world infrastructure deployment workflows.

---

## Architecture

User → Application Load Balancer (ALB) → EC2 Application Server → Amazon RDS Database

### Components

* Amazon VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables and Associations
* Security Groups
* EC2 Instance
* Application Load Balancer
* Target Group
* Amazon RDS
* Terraform
* Git & GitHub
* GitHub Actions (CI/CD)

---

## Objectives

* Build cloud infrastructure using Infrastructure as Code (Terraform)
* Deploy a secure three-tier architecture in AWS
* Understand public vs. private networking
* Configure routing and internet connectivity
* Implement Git version control
* Simulate enterprise CI/CD workflows using GitHub Actions
* Troubleshoot and resolve infrastructure deployment issues

---

## Key Challenges & Troubleshooting

During deployment several issues were identified and resolved:

### Missing Internet Gateway Route

Issue:

* Application Load Balancer was inaccessible from the internet.

Root Cause:

* Public route table did not contain a route to the Internet Gateway.

Resolution:

* Added Internet Gateway resource and associated route table entry:

  * 0.0.0.0/0 → Internet Gateway

---

### Missing Route Table Associations

Issue:

* Subnets were not properly associated with route tables.

Resolution:

* Created and verified route table associations for both public and private subnets.

---

### Missing Target Group Registration

Issue:

* Load Balancer returned errors because no healthy targets were available.

Resolution:

* Created and attached a Target Group to the Application Load Balancer.
* Registered EC2 instance as a target.

---

### 504 Gateway Timeout

Issue:

* ALB returned a 504 Gateway Timeout.

Root Cause:

* Application service was not running on the EC2 instance.

Resolution:

* Connected to EC2 and verified application configuration and service availability.

---

### EC2 Key Pair Errors

Issue:

* Terraform deployment failed because the specified key pair did not exist.

Resolution:

* Created and referenced the correct AWS key pair within Terraform.

---

## CI/CD Implementation

To simulate a real enterprise deployment workflow, GitHub Actions was implemented.

### Pipeline Tasks

* Terraform Init
* Terraform Format Check
* Terraform Validate

This allows infrastructure code to be automatically reviewed whenever code is pushed to GitHub or submitted through a pull request.

### Workflow Benefits

* Detects syntax issues before deployment
* Validates Terraform configuration automatically
* Encourages peer review and version control practices
* Simulates real-world DevOps workflows

---

## Skills Demonstrated

### Cloud Engineering

* AWS Networking
* VPC Design
* Load Balancing
* RDS Deployment
* Security Groups
* Route Tables
* Internet Gateways
* NAT Gateways

### Infrastructure as Code

* Terraform
* Resource Dependencies
* Infrastructure Automation

### DevOps

* Git
* GitHub
* Pull Requests
* GitHub Actions
* CI/CD Pipelines

### Troubleshooting

* Network Connectivity
* Routing Issues
* Load Balancer Configuration
* EC2 Connectivity
* Infrastructure Validation

---

## Lessons Learned

This project reinforced the importance of troubleshooting, infrastructure validation, and understanding how AWS networking components work together. Building the environment from scratch provided hands-on experience with real deployment issues that cloud engineers commonly encounter in production environments.

Rather than simply deploying resources, this project emphasized reading Terraform output, debugging failures, validating configurations, and implementing CI/CD processes that mirror modern cloud engineering practices.

---

## Future Enhancements

* Auto Scaling Group
* Multi-AZ Application Tier
* Remote Terraform State (S3 + DynamoDB)
* CloudWatch Monitoring
* AWS WAF
* Terraform Modules
* Automated Terraform Plan & Apply Workflow
* Blue/Green Deployment Strategy
