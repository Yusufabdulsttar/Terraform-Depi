resource "aws_instance" "Instance" {
  ami             = var.AMI
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "Yusuf-Ec2-instance"
  }
}