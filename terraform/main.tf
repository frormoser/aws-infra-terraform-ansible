# Provider block: specify which cloud provider and region to use
provider "aws" {
  region = "us-east-1"  # AWS region where resources will be created
}

# Resource block: create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-00ca32bbc84273381"  # Amazon Linux 2023 AMI (x86_64)
  instance_type = "t2.micro"               # Instance type eligible for free tier

  # SSH Key pair to allow secure SSH access to the EC2 instance
  key_name = "terraform-ansible-key"       # Must match the key you created in AWS

  # Tags for identifying the instance in the AWS console
  tags = {
    Name = "WebServer"                     # Friendly name for the instance
  }
}

# Output block: show the public IP after Terraform applies
output "public_ip" {
  value = aws_instance.web.public_ip       # Will display the public IP of the instance
}

