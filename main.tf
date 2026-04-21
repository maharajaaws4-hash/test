provider "aws" {
  region = "ap-south-1"
}

# Create a new key pair
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("/c/Users/acer/.ssh/id_rsa.pub")  # path to your local public key
}

# Create a new security group
resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the EC2 instance
resource "aws_instance" "ubuntu_vm" {
  ami           = "ami-00111452cb3c5dda0" # Ubuntu AMI in ap-south-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
}

