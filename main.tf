provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ubuntu_vm" {
  ami           = "ami-00111452cb3c5dda0" # Ubuntu AMI in ap-south-1
  instance_type = "t2.micro"
  key_name      = "my-key"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
}

