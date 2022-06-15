variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.0.1.0/24"
  # auto assign public IP to ec2 instance when created
  # default is false
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.aws_region}b"
}

resource "aws_subnet" "subnet_3" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.aws_region}c"
}

resource "aws_internet_gateway" "igw_1" {
  vpc_id = aws_vpc.vpc_1.id
}

resource "aws_route" "route_1" {
  route_table_id         = aws_vpc.vpc_1.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_1.id
}

resource "aws_security_group" "sg_1" {
  vpc_id      = aws_vpc.vpc_1.id
  name        = "sg_1"
  description = "Allow everything"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_2" {
  vpc_id      = aws_vpc.vpc_1.id
  name        = "sg_2"
  description = "Block everything"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/32"]
  }
}
