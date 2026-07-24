# 🚀 Amazon EC2 Web Server using User Data

![AWS](https://img.shields.io/badge/AWS-EC2-orange?logo=amazonaws)
![Linux](https://img.shields.io/badge/OS-Amazon%20Linux-green)
![Apache](https://img.shields.io/badge/Web%20Server-Apache-red)
![License](https://img.shields.io/badge/License-MIT-blue)

Deploy an **Apache Web Server** on an **Amazon EC2 instance** using **EC2 User Data** for automatic installation and configuration.

This beginner-friendly project demonstrates how to launch an EC2 instance, configure networking, automate server provisioning, and host a simple web page without manually logging into the server.

---

## 📖 Table of Contents

* [Overview]
* [Architecture]
* [Features]
* [Prerequisites]
* [Deployment Steps]
* [User Data Script]
* [Testing the Deployment]
* [Project Structure]
* [Cleanup]
* [Future Improvements]
* [Author]

---

# 📌 Overview

Amazon EC2 (Elastic Compute Cloud) enables you to launch virtual machines in the AWS Cloud.

In this project, an EC2 instance automatically installs and configures the **Apache HTTP Server** during its first boot using **User Data**, making the deployment completely automated.

---

# 🏗️ Architecture

<p align="center">
  <img src="aws architecture.png" alt="AWS EC2 Architecture" width="850">
</p>

### Deployment Flow

```text
Internet
      │
      ▼
Security Group
(SSH :22 | HTTP :80)
      │
      ▼
Amazon EC2 Instance
(Apache HTTP Server)
      │
      ▼
Static HTML Website
```

---

# ✨ Features

* 🚀 Launch an Amazon EC2 instance
* 🔒 Configure Security Groups
* ⚙️ Automatically install Apache using User Data
* 🌐 Host a public website
* 💻 Connect securely via SSH
* ☁️ Beginner-friendly AWS project

---

# ✅ Prerequisites

* AWS Account (Free Tier eligible)
* EC2 Key Pair
* Basic Linux knowledge
* SSH Client
* AWS Management Console access

---

# 🚀 Deployment Steps

## Step 1: Launch an EC2 Instance

* Open the AWS Management Console.
* Navigate to **EC2**.
* Click **Launch Instance**.
* Select the **Amazon Linux 2 AMI**.
* Choose **t3.micro** as the instance type.
* Create or select an existing Key Pair.

---

## Step 2: Configure the Security Group

Create the following inbound rules.

| Type | Port | Source                |
| ---- | ---- | --------------------- |
| SSH  | 22   | My IP *(Recommended)* |
| HTTP | 80   | 0.0.0.0/0             |

---

## Step 3: Add User Data

Under **Advanced Details → User Data**, paste the following script.

```bash
#!/bin/bash

yum update -y

yum install -y httpd

systemctl start httpd

systemctl enable httpd

echo "<h1>Hello World from EC2 User Data!</h1>" > /var/www/html/index.html
```

This script:

* Updates system packages
* Installs Apache
* Starts the Apache service
* Enables Apache after reboot
* Creates a sample web page

---

## Step 4: Launch the Instance

Wait until the instance reaches the **Running** state.

Copy the:

* Public IPv4 Address
* Public DNS

---

## Step 5: Test the Deployment

Open your browser and visit:

```text
http://<EC2-Public-IP>
```

or

```text
http://<EC2-Public-DNS>
```

Expected Output:

```html
Hello World from EC2 User Data!
```

---

## Step 6: (Optional) Connect via SSH

```bash
ssh -i your-key.pem ec2-user@<EC2-Public-IP>
```

Check Apache status:

```bash
sudo systemctl status httpd
```

---

# 📂 Project Structure

```text
EC2-Web-Server/
│
├── README.md
├── userdata.sh
└── images/
    └── architecture.png
```

---

# 🧹 Cleanup

To avoid unnecessary AWS charges:

1. Open the EC2 Console.
2. Select your instance.
3. Click **Instance State**.
4. Choose **Terminate Instance**.

---

# 🚀 Future Improvements

* Deploy a custom HTML/CSS website
* Host a React or Node.js application
* Add HTTPS using AWS Certificate Manager
* Configure Route 53 with a custom domain
* Assign an Elastic IP
* Automate deployment using AWS CloudFormation
* Integrate GitHub Actions for CI/CD

---

# 👨‍💻 Author

**Ved Sharma**

* 🌐 Portfolio: *https://techxved.me*
* 💼 LinkedIn: *Add your LinkedIn profile*
* 🐙 GitHub: *Add your GitHub profile*

---

## ⭐ Support

If you found this project helpful, consider giving it a **⭐ Star**. It helps others discover the project and motivates me to create more cloud and AWS tutorials.

Happy Cloud Learning! ☁️🚀
