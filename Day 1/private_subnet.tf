resource "aws_subnet" "privSubnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.5.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = false
tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "privSubnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.6.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = false
tags = {
    Name = "Private Subnet 2"
  }
}