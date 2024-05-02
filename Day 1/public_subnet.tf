resource "aws_subnet" "pubSubnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "pubSubnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.4.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
tags = {
    Name = "Public Subnet 2"
  }
}