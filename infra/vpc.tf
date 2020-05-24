# create virtual private cloud (VPC) where you will deploy EC2 instances, application and the backend postgreSQL database
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloud VPC"
  }
}

# create internet gateway to be able to connect to the above VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "cloud VPC IGW"
  }
}
# we have to update default route table, for AWS to send internet traffic to the above internet-gateway
resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Default Route Table For VPC IGW"
  }
}

# we create subnets, where we will deploy the VMs to host the application, and our database
# we create a total of 9 subnets, 3 in each availability zones (public, private, data)

# public availability zones are created in three zones. we wil map public ip to any intances launched within these zones
resource "aws_subnet" "public_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/22"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC_AZ1"
  }
}
resource "aws_subnet" "public_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/22"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC_AZ2"
  }
}
resource "aws_subnet" "public_az3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.8.0/22"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC_AZ3"
  }
}

# we create three subnets for three private availability zones. This will be where we will deploy the VMs on which we will deploy our application. We will also map a public ip to the instances launched in these zones, so that they can be accessed in future.
resource "aws_subnet" "private_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.16.0/22"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PRIVATE_AZ1"
  }
}
resource "aws_subnet" "private_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.20.0/22"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PRIVATE_AZ2"
  }
}
resource "aws_subnet" "private_az3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.24.0/22"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "PRIVATE_AZ3"
  }
}
# we three subnets for our three data availability zones. This where we will be deploying our postgreSQL database server.
resource "aws_subnet" "data_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.32.0/22"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "DATA_AZ1"
  }
}
resource "aws_subnet" "data_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.36.0/22"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "DATA_AZ2"
  }
}
resource "aws_subnet" "data_az3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.40.0/22"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "DATA_AZ3"
  }
}