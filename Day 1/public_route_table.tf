resource "aws_route_table" "pubRT" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route" "pub_route" {
  route_table_id          = aws_route_table.pubRT.id
  destination_cidr_block  = "0.0.0.0/0" 
  gateway_id              = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "pub_assoc" {
  subnet_id     = aws_subnet.pubSubnet1.id
  route_table_id = aws_route_table.pubRT.id
}

resource "aws_route_table_association" "pub_assoc2" {
  subnet_id     = aws_subnet.pubSubnet2.id
  route_table_id = aws_route_table.pubRT.id
}