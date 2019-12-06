provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Gateway
resource "aws_internet_gateway" "example-gw" {
  vpc_id = "${aws_vpc.example.id}"

  tags = {
    Name = "example-gw"
  }
}

# VPC
resource "aws_vpc" "example" {
  cidr_block           = "100.10.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "example"
  }
}

# Subnet
resource "aws_subnet" "example-public" {
  vpc_id                  = "${aws_vpc.example.id}"
  availability_zone       = "us-east-1b"
  cidr_block              = "100.10.0.0/20"
  ipv6_cidr_block         = ""
  map_public_ip_on_launch = "true"

  tags = {
    Name = "example"
  }
}

# Security Groups
resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = "${aws_vpc.example.id}"

  tags = {
    name = "example"
  }
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.example.id}"
  description       = "Public HTTP"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.example.id}"
  description       = "Public SSH"
}

resource "aws_security_group_rule" "example_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.example.id}"
  description       = "Allow all out"
}

# Route Tables
resource "aws_route_table" "example-rt" {
  vpc_id = "${aws_vpc.example.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.example-gw.id}"
  }

  tags = {
    Name = "example-rt"
  }
}

resource "aws_route_table_association" "example-a" {
  subnet_id      = "${aws_subnet.example-public.id}"
  route_table_id = "${aws_route_table.example-rt.id}"
}


# EC2 Instance
data "aws_ami" "example_ami" {
  most_recent = true

  filter {
    name = "name"

    values = ["example*"]
  }

  owners = ["${var.aws_account_id}"]
}

resource "aws_instance" "example" {
  ami                    = "${data.aws_ami.example_ami.id}"
  instance_type          = "${var.default_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]
  subnet_id              = "${aws_subnet.example-public.id}"
  key_name               = "default"
  depends_on             = ["aws_internet_gateway.example-gw"]
    
  tags = {
    Name = "example"
  }
}