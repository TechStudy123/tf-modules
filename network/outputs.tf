output "vpc_id" {
  description = "作った VPC の ID"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "作ったパブリックサブネットの ID"
  value       = aws_subnet.public.id
}
