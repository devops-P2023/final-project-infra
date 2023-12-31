

# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-eks" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-eks-${terraform.workspace}"
  }
}

# Resource: Create Subnet 1
resource "aws_subnet" "vpc-eks-private-subnet-1" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc-eks-private-subnet-1-${terraform.workspace}"
  }
}

# Resource: Create Subnet 2
resource "aws_subnet" "vpc-eks-private-subnet-2" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc-eks-private-subnet-2-${terraform.workspace}"
  }
}

# Resource: Internet Gateway
resource "aws_internet_gateway" "vpc-eks-igw" {
  vpc_id = aws_vpc.vpc-eks.id

  tags = {
    Name = "vpc-eks-igw-${terraform.workspace}"
  }
}

#  Resource: Route table:
 resource "aws_default_route_table" "vpc-eks-rt" {
  default_route_table_id = aws_vpc.vpc-eks.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-eks-igw.id
  }

  tags = {
    Name = "vpc-eks-rt-${terraform.workspace}"
  }
} 
 



# Resource: Security Group
resource "aws_security_group" "eks-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-eks.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 




