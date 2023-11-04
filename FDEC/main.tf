terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}


provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAWCUIDTMKBZCCSJ72"
  secret_key = "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"
}
resource "aws_instance" "web2" {
  ami           = "ami-010f8b02680f80998"
  instance_type = "t2.micro"
  key_name = "keyforuswest"
  tags = {
    Name = "nginxserver"
   }

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install  nginx -y
  sudo systemctl start nginx
  sudo systemctl enable nginx
  EOF
}
