locals {
  ssh_private_key = file("${path.module}/key.pem")
}
output "ssh_private_key" {
  value = local.ssh_private_key
  sensitive = true
}

resource "aws_instance" "bastion" {
  ami           = "ami-0d421d84814b7d51c" 
  instance_type = "t2.micro"    
  subnet_id     = aws_subnet.pubSubnet1.id  
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "Bastion"
  }
 user_data = <<-EOF
    #!/bin/bash
    mkdir -p /home/ec2-user/.ssh
    echo "${local.ssh_private_key}" > /home/ec2-user/.ssh/id_rsa
    chmod 600 /home/ec2-user/.ssh/id_rsa
    chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa
  EOF

}

resource "aws_instance" "application" {
  ami           = "ami-0d421d84814b7d51c"  
  instance_type = "t2.micro"    
  subnet_id     = aws_subnet.privSubnet1.id  
  vpc_security_group_ids = [aws_security_group.allow_ssh_and_3000.id]
  key_name      = aws_key_pair.ssh_key.key_name 
  tags = {
    Name = "Application Server"
  }
}
