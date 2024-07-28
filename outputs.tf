output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "instance" {
  value = aws_instance.Instance
}