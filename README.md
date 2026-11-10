# AWS Infrastructure & EC2 Provisioning Log

This log covers my first hands-on experience setting up an EC2 instance on AWS. I worked through launching a virtual machine, configuring security groups, using User Data to automate the initial setup, and troubleshooting issues that came up during deployment.

---

### Module 1: EC2 Setup & Security Groups

My first task was to launch a virtual machine using a `t3.micro` instance and the Amazon Linux 2023 AMI in the Frankfurt region (`eu-central-1`).

**Things I got wrong and learned along the way:**

- **Security Group mistake:** During my first attempt, I launched the instance before properly checking the security group rules and adding my startup script. The instance showed as running in AWS, but I couldn't access a web page because inbound HTTP traffic on port 80 hadn't been allowed.
- **Understanding User Data:** I also learned that changing the User Data script after an instance has already launched doesn't automatically run the new commands. The script normally runs during the first boot. Simply stopping and starting the instance won't make the original setup process run again.
- **Starting over:** Rather than trying to work around the mistakes in my first setup, I decided to terminate the instance and launch a new one with the correct settings. This also reminded me to check that I wasn't leaving unnecessary EC2 resources running.

---

### Module 2: User Data & Automated Nginx Installation

For my second attempt, I went through the launch process again and paid more attention to the configuration before starting the instance. This time, I wanted AWS to install and start the web server automatically rather than having to connect manually and configure everything afterwards.

**Things I practised and problems I fixed:**

- **Security Group rules:** I configured the inbound rules to allow SSH on port 22, HTTP on port 80, and HTTPS on port 443. This helped me understand how security groups control which traffic can reach an EC2 instance.
- **Fixing typos in User Data:** While writing the startup commands, I made a couple of typing mistakes. I wrote `systemcts` instead of `systemctl` and `nging` instead of `nginx` when referring to the installation path. These small errors reminded me how important it is to check commands and file paths when automating server setup.
- **Installing Nginx:** I corrected the script and used `dnf update -y` followed by `dnf install -y nginx` to update the package information and install Nginx on Amazon Linux 2023.
- **Checking the deployment:** After launching the instance, I waited until AWS showed `2/2 checks passed`. I then copied the public IPv4 address into my browser using `http://` and was able to see my custom web page.

---

### Overall Progress

This was my first experience setting up a web server directly through AWS rather than just working locally. My first attempt didn't work because I rushed through the configuration, but repeating the deployment helped me understand how EC2, User Data, and Security Groups work together.

The main thing I took away from this exercise was that an instance showing as running doesn't necessarily mean the application running on it is accessible. I need to check the network rules, startup script, and service status as well.

I also want to get into the habit of checking my configurations before launching resources, rather than having to terminate instances and repeat the process.
