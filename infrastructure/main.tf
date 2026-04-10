provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "ssh" {
  name = "allow-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "staging" {
  ami           = "ami-0e872aee57663ae2d"
  instance_type = "t3.micro"
  key_name      = "morninggrind-key"

  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "morninggrind-staging"
    Environment = "staging"
    Project     = "morninggrind"
  }
}

resource "aws_instance" "production" {
  ami           = "ami-0e872aee57663ae2d"
  instance_type = "t3.micro"
  key_name      = "morninggrind-key"

  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "morninggrind-production"
    Environment = "production"
    Project     = "morninggrind"
  }
}