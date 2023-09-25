terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "terra_aws" {
  cidr_block = "23.0.0.0/16"
}

resource "aws_subnet" "terra_aws_pub" {
  vpc_id     = aws_vpc.terra_aws.id
  cidr_block = "23.0.4.0/24"

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "terra_aws_pri" {
  vpc_id     = aws_vpc.terra_aws.id
  cidr_block = "23.0.8.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_security_group" "terra_aws" {
  name        = "my-security-group"
  description = "Security group for Assignment EC2 instance"
  vpc_id      = aws_vpc.terra_aws.id

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

resource "aws_instance" "terra_aws" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terra_aws_pub.id
  vpc_security_group_ids = [aws_security_group.terra_aws.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

   tags = {
    "purpose" = "Assignment"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terra_aws.id
}

resource "aws_route_table" "terra_aws_pub" {
  vpc_id = aws_vpc.terra_aws.id
}

resource "aws_route_table_association" "subnet" {
  subnet_id      = aws_subnet.terra_aws_pub.id
  route_table_id = aws_route_table.terra_aws_pub.id
}

resource "aws_route_table_association" "igw" {
  gateway_id     = aws_internet_gateway.gw.id
  route_table_id = aws_route_table.terra_aws_pub.id
}
