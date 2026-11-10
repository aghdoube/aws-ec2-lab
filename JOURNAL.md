# AWS Infrastructure & EC2 Provisioning Log

I used this lab to practise setting up an EC2 instance on AWS and getting a web server running. I worked with security groups, User Data scripts and Nginx. I also ran into a few problems during the first attempt, which I had to fix before getting everything working.

---

### Module 1: EC2 Setup & Security Groups

I started by launching a `t3.micro` instance using Amazon Linux 2023 in the Frankfurt region (`eu-central-1`).

**What went wrong during my first attempt:**

- **Security Group:** I launched the instance without checking all the required inbound rules first. The instance was running, but I couldn't access the website because HTTP traffic on port 80 was blocked.
- **User Data:** I also found out that changing the User Data script after launching an instance doesn't automatically execute the updated commands. By default, the script runs during the first boot. Simply stopping and starting the instance doesn't run the initial script again.
- **Starting again:** Since I had missed some settings during the first launch, I decided to terminate the instance and start again with the correct configuration. I also wanted to make sure I wasn't leaving unused instances running and generating costs.

---

### Module 2: User Data & Nginx Installation

For the second attempt, I checked the configuration more carefully before launching the instance. I wanted to get Nginx installed automatically through User Data instead of connecting through SSH and doing everything manually.

**What I practised and fixed:**

- **Security Group rules:** I added inbound rules for SSH (port 22), HTTP (port 80) and HTTPS (port 443). This helped me understand which ports need to be accessible for different types of traffic.
- **Typos in the script:** While writing my User Data commands, I made a few typing mistakes. For example, I accidentally wrote `systemcts` instead of `systemctl` and `nging` instead of `nginx`. I corrected these before running the deployment again.
- **Installing Nginx:** I used `dnf update -y` and `dnf install -y nginx` in the startup script to update the system and install Nginx.
- **Testing the result:** Once the instance had launched and AWS showed `2/2 checks passed`, I copied its public IPv4 address into my browser using `http://`. This time, my custom web page loaded successfully without me having to configure the web server manually through SSH.

---

### What I Learned

This lab helped me understand how EC2, security groups and User Data work together. My first attempt didn't work because I rushed through the settings, but starting again gave me a better understanding of what needs to be configured before launching an instance.

One thing I learned is that seeing an instance marked as `Running` in AWS doesn't necessarily mean the website is working. I also need to check the security group rules, whether the User Data script executed properly and whether Nginx is actually running.

Next time, I want to spend more time checking the configuration before launching an instance instead of having to go back and fix things afterwards.
