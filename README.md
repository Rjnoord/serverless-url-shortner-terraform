# Serverless URL Shortener with AWS, Terraform & GitHub Actions

## Project Overview

This project demonstrates the deployment of a serverless URL shortener using AWS cloud services, Terraform Infrastructure as Code (IaC), Git version control, and GitHub Actions CI/CD pipelines.

The goal of the project is to create a scalable, low-cost, serverless application that can store and retrieve shortened URLs without managing traditional servers.

---

## Architecture

```text
User
 ↓
API Gateway
 ↓
AWS Lambda
 ↓
Amazon DynamoDB
```

### AWS Services Used

* Amazon API Gateway
* AWS Lambda
* Amazon DynamoDB
* IAM Roles & Policies
* Terraform
* Git & GitHub
* GitHub Actions

---

## Project Objectives

* Learn serverless application architecture
* Deploy AWS resources using Terraform
* Understand API Gateway and Lambda integrations
* Use DynamoDB as a NoSQL database
* Implement Git version control
* Build a CI/CD pipeline with GitHub Actions
* Simulate enterprise cloud engineering workflows

---

## Why Serverless?

Traditional applications require:

* EC2 Instances
* Operating System Management
* Patching
* Scaling Configuration
* Capacity Planning

This project uses serverless services, allowing AWS to manage the underlying infrastructure automatically.

Benefits include:

* Lower operational overhead
* Automatic scaling
* Pay-per-use pricing
* Reduced infrastructure management

---

## Application Workflow

### Create Short URL

1. User submits a long URL.
2. API Gateway receives the request.
3. Lambda generates a short code.
4. DynamoDB stores:

```text
abc123 → https://www.example.com
```

5. Response returns the shortened URL.

---

### Retrieve URL

1. User accesses:

```text
https://myapp.com/abc123
```

2. API Gateway invokes Lambda.
3. Lambda queries DynamoDB.
4. Original URL is returned.
5. User is redirected.

---

## Why DynamoDB?

DynamoDB was selected because the application requires extremely fast key-value lookups.

Example:

```text
Key: abc123
Value: https://www.example.com
```

Benefits:

* Serverless database
* Millisecond response times
* Automatic scaling
* No database server management
* Highly available by default

---

## CI/CD Pipeline

GitHub Actions was implemented to automate infrastructure validation before deployment.

### Pipeline Tasks

* Terraform Init
* Terraform Format Check
* Terraform Validate

### Workflow

Developer writes Terraform code
↓
Git Commit
↓
Git Push
↓
GitHub Actions Runs
↓
Terraform Validation
↓
Pull Request Review
↓
Deployment Approval

This workflow mirrors modern cloud engineering and DevOps practices.

---

## Skills Demonstrated

### Cloud Engineering

* AWS Serverless Architecture
* API Gateway
* AWS Lambda
* DynamoDB
* IAM

### Infrastructure as Code

* Terraform
* Resource Management
* Infrastructure Automation

### DevOps

* Git
* GitHub
* Pull Requests
* GitHub Actions
* CI/CD Pipelines

### Architecture

* Serverless Design
* API Integration
* Event-Driven Computing
* NoSQL Database Design

---

## Key Lessons Learned

This project provided hands-on experience designing and deploying a serverless architecture using AWS services. It reinforced the importance of Infrastructure as Code, version control, automated validation, and cloud-native application design.

By combining Terraform and GitHub Actions, the project simulates how cloud engineers build, validate, review, and deploy infrastructure in modern enterprise environments.

---

## Future Enhancements

* Custom Domain Name
* CloudWatch Monitoring
* Route 53 Integration
* HTTPS with ACM
* Lambda Environment Variables
* Terraform Remote State (S3 + DynamoDB)
* Automated Terraform Plan & Apply
* URL Analytics Dashboard
* User Authentication with Amazon Cognito
