# aws-ec2-lab

My first hands-on exercises with AWS EC2 (region eu-central-1, Frankfurt).

## What I did
- Launched an EC2 instance (t3.micro) and connected via SSH
- Installed nginx and exposed it to the internet through port 80
- Set up a server automatically with a user data script
- Terminated the instance afterwards to avoid costs

## user-data.sh
Startup script for an EC2 instance: installs nginx and serves a custom web page. It only runs on the first boot of the instance.