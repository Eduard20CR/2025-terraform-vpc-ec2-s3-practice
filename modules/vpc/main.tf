resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  assign_generated_ipv6_cidr_block = true
  enable_dns_support               = true
  enable_dns_hostnames             = true
}

resource "aws_subnet" "private_data" {
  count = var.amount_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_subnet" "public_web" {
  count = var.amount_subnets

  vpc_id                          = aws_vpc.main.id
  cidr_block                      = cidrsubnet(var.cidr_block, 8, count.index + var.amount_subnets)
  availability_zone               = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

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

resource "aws_route_table_association" "private" {
  count          = var.amount_subnets
  subnet_id      = aws_subnet.private_data[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  count          = var.amount_subnets
  subnet_id      = aws_subnet.public_web[count.index].id
  route_table_id = aws_route_table.public.id
}


