  # Shopping-vpc 생성
resource "aws_vpc" "shopping-vpc" {
  cidr_block       = "10.0.0.0/16"
  
  tags = {
    Name = "shopping-vpc"
  }
}
# db-vpc 생성
resource "aws_vpc" "shopping-db-vpc" {
  cidr_block       = "10.10.0.0/20"
  
  tags = {
    Name = "shopping-db-vpc"
  }
}
# bastion-vpc 생성
resource "aws_vpc" "bastion-vpc" {
  cidr_block       = "10.20.0.0/24"
  
  tags = {
    Name = "bastion-vpc"
  }
}


# Shopping-vpc Subnet 생성
resource "aws_subnet" "internal-node1-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "internal-node1-subnet"
  }
}
resource "aws_subnet" "internal-node2-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name = "internal-node2-subnet"
  }
}
resource "aws_subnet" "firewall-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "firewall-subnet"
  }
}
resource "aws_subnet" "master-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "${var.region}d"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "master-subnet"
  }
}
resource "aws_subnet" "worker1-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "${var.region}d"

  tags = {
    Name = "worker1-subnet"
  }
}
resource "aws_subnet" "worker2-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.31.0/24"
  availability_zone = "${var.region}d"

  tags = {
    Name = "worker2-subnet"
  }
}
resource "aws_subnet" "worker3-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.32.0/24"
  availability_zone = "${var.region}d"

  tags = {
    Name = "worker3-subnet"
  }
}
resource "aws_subnet" "worker4-subnet" {
  vpc_id     = aws_vpc.shopping-vpc.id
  cidr_block = "10.0.33.0/24"
  availability_zone = "${var.region}d"

  tags = {
    Name = "worker4-subnet"
  }
}

# shopping-db-vpc Subnet
resource "aws_subnet" "db1-subnet" {
  vpc_id     = aws_vpc.shopping-db-vpc.id
  cidr_block = "10.10.0.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name = "db1-subnet"
  }
}
resource "aws_subnet" "db2-subnet" {
  vpc_id     = aws_vpc.shopping-db-vpc.id
  cidr_block = "10.10.10.0/24"
  availability_zone = "${var.region}d"

  tags = {
    Name = "db2-subnet"
  }
}


# Bastion-vpc Subnet
resource "aws_subnet" "bastion-subnet" {
  vpc_id     = aws_vpc.bastion-vpc.id
  cidr_block = "10.20.0.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "bastion-subnet"
  }
}