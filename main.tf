provider "aws" {
  access_key = "pqr"
  secret_key = "abc/"
  region     = "ap-south-1"
}
resource "aws_security_group" "web_app" {
  name        = "web_app"
  description = "security group"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "web_app"
  }
}
resource "aws_instance" "webapp_instance" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = var.instance_type
  security_groups= ["web_app"]
  key_name = var.key_name
  tags = {
    Name = "webapp_instance"
  }
}

