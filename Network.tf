// Create a VPC with the specified CIDR block
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = "Yusuf_Vpc"
  }
}

// Create a public subnet within the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_block_Public_subnet
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Yusuf_terraform_public_subnet"
  }
}

// Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Yusuf_terraform_gateway"
  }
}

// Create a public route table for the VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Yusuf_terraform"
  }
}

// Associate the public route table with the public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

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

  tags = {
    Name = "Yusuf_terraform_instance_sg"
  }
}