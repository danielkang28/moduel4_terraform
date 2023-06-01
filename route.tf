# route.tf

resource "aws_internet_gateway" "shopping-igw" {
  vpc_id = aws_vpc.shopping-vpc.id

  tags = {
    Name = "shopping-igw"
  }
}


resource "aws_default_route_table" "r1" {
  default_route_table_id = aws_vpc.shopping-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shopping-igw.id
  }

  tags = {
    Name = "shopping-rt"
  }
}

resource "aws_default_route_table" "r2" {
  default_route_table_id = aws_vpc.shopping-db-vpc.default_route_table_id



  tags = {
    Name = "shopping-db-rt"
  }
}

resource "aws_default_route_table" "r3" {
  default_route_table_id = aws_vpc.bastion-vpc.default_route_table_id


  tags = {
    Name = "bastion-rt"
  }
}
