# nacl.tf

resource "aws_default_network_acl" "shopping-internalnode-nacl" {
  default_network_acl_id = aws_vpc.shopping-vpc.default_network_acl_id
  
  # INBOUDN
  # HTTP(80)
  ingress {
    rule_no    = 110
    protocol   = -1
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  # HTTPS(443)
  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }


  # OUTBOUND
  egress {
    rule_no    = 110
    protocol   = -1
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    rule_no    = 113
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }


  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "shopping-internalnode-nacl"
  }

}

resource "aws_network_acl" "shopping-firewall-nacl" {
  vpc_id = aws_vpc.shopping-vpc.id
  subnet_ids = [aws_subnet.firewall-subnet.id]

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 130
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "219.240.87.167/32"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    rule_no    = 140
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # OUTBOUDN
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    rule_no    = 130
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "219.240.87.167/32"
    from_port  = 22
    to_port    = 22
  }

  egress {
    rule_no    = 140
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }


  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  
  tags = {
    Name = "shopping-firewall-nacl"
  }
}


resource "aws_network_acl" "shopping-masternode-nacl" {
  vpc_id = aws_vpc.shopping-vpc.id
  subnet_ids = [aws_subnet.master-subnet.id]

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # OUTBOUND
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    rule_no    = 113
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }



  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "shopping-masternode-nacl"
  }
}

resource "aws_network_acl" "shopping-workernode-nacl" {
  vpc_id = aws_vpc.shopping-vpc.id
  subnet_ids = [
    aws_subnet.worker1-subnet.id, 
    aws_subnet.worker2-subnet.id, 
    aws_subnet.worker3-subnet.id, 
    aws_subnet.worker4-subnet.id
  ]

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # OutBound
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 65535
  }

  egress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    rule_no    = 113
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }


  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  
  tags = {
    Name = "shopping-workernode-nacl"
  }
}


/* 
Shopping-db-vpc Network ACL
*/

resource "aws_default_network_acl" "shopping-db1-nacl" {
  default_network_acl_id = aws_vpc.shopping-db-vpc.default_network_acl_id

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.10.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.20.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  # OutBound
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }

  egress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.10.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  egress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.20.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }



  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "shopping-db1-nacl"
  }
}


resource "aws_network_acl" "shopping-db2-nacl" {
  vpc_id = aws_vpc.shopping-db-vpc.id
  subnet_ids = [aws_subnet.db2-subnet.id]

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }


  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "shopping-db2-nacl"
  }
}


/*
  bastion-nacl
*/

resource "aws_default_network_acl" "bastion-nacl" {
  default_network_acl_id = aws_vpc.bastion-vpc.default_network_acl_id

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "172.16.0.0/22"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.20.0.0/24"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    rule_no    = 130
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  # OutBound
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "172.16.0.0/22"
    from_port  = 443
    to_port    = 443
  }

  egress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.20.0.0/24"
    from_port  = 22
    to_port    = 22
  }

  egress {
    rule_no    = 130
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.10.0.0/24"
    from_port  = 3306
    to_port    = 3306
  }


  ingress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 900
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  
  tags = {
    Name = "bastion-nacl"
  }
}