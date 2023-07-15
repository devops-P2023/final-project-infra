# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-eks" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-eks"
  }
}

# Resource: Create Subnet 1
resource "aws_subnet" "vpc-eks-private-subnet-1" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc-eks-private-subnet-1"
  }
}

# Resource: Create Subnet 2
resource "aws_subnet" "vpc-eks-private-subnet-2" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc-eks-private-subnet-2"
  }
}

# Resource: Internet Gateway
resource "aws_internet_gateway" "vpc-eks-igw" {
  vpc_id = aws_vpc.vpc-eks.id

  tags = {
    Name = "vpc-eks-igw"
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
    Name = "vpc-eks-rt"
  }
} 
 








