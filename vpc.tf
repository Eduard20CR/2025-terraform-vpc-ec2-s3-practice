# VPC

resource "aws_vpc" "main" {
  cidr_block = "10.35.0.0/16"
}

# SUBNETS

resource "aws_subnet" "private_data_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.35.0.0/18"
}

resource "aws_subnet" "private_data_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.35.64.0/18"
}

resource "aws_subnet" "public_web_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.35.128.0/18"
}

resource "aws_subnet" "public_web_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.35.192.0/18"
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# ROUTE TABLE

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

# ROUTE TABLE ASSOCIATIONS

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_web_a.id
  route_table_id = aws_route_table.public.id
}

