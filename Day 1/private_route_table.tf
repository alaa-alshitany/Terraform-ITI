resource "aws_eip" "elasticIP" {
  domain = "vpc"
}
// assign elastic ip to natgateway to save access to private subnet incase of failure(ip of nat doesn't change)
resource "aws_nat_gateway" "natGW" {
  allocation_id = aws_eip.elasticIP.id
  subnet_id     = aws_subnet.pubSubnet1.id 
}

resource "aws_route_table" "privRT" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route" "priv_route" {
  route_table_id          = aws_route_table.privRT.id
  destination_cidr_block  = "0.0.0.0/0"  
  nat_gateway_id          = aws_nat_gateway.natGW.id
}

resource "aws_route_table_association" "private_assoc1" {
  subnet_id     = aws_subnet.privSubnet1.id
  route_table_id = aws_route_table.privRT.id
}

resource "aws_route_table_association" "private_assoc2" {
  subnet_id     = aws_subnet.privSubnet2.id
  route_table_id = aws_route_table.privRT.id
}