output "url" {
  description = "ブラウザで開くアドレス"
  value       = "http://${aws_instance.this.public_ip}"
}

output "security_group_id" {
  description = "Web サーバーのセキュリティグループの ID"
  value       = aws_security_group.this.id
}
