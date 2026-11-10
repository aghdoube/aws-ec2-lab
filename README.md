# AWS EC2 Lab

My first hands-on project with AWS EC2, using the Frankfurt region (`eu-central-1`).

## 🎯 What I did

- Launched a `t3.micro` EC2 instance.
- Connected to the instance using SSH.
- Installed Nginx and made the web server accessible through port 80.
- Used a User Data script to automate the initial server setup.
- Tested the web page through the instance's public IP address.
- Terminated the instance after testing to avoid unnecessary costs.

## 📁 Repository Structure

- **`scripts/`** – Contains the scripts used for the server setup.
  - `user-data.sh` – Installs Nginx and creates a custom web page when the EC2 instance first boots.

## 🚀 How to Run

When launching a new EC2 instance through the AWS Management Console or AWS CLI, provide the contents of `scripts/user-data.sh` as the User Data script.

AWS runs the script during the initial boot, installing Nginx and setting up the web page automatically.

---

## 📓 Cloud Infrastructure Lab Log

For a more detailed breakdown of the setup, mistakes I encountered, and how I fixed them, see:

**[JOURNAL.md – AWS Console Troubleshooting & Deployment Notes](./JOURNAL.md)**