# Web サーバーのモジュール（セキュリティグループ・EC2 1台）。VPC とサブネットは入力として受け取る
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "this" {
  name        = "${var.name}-web-sg"
  description = "Allow HTTP from the internet"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.this.id
  description       = "HTTP"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]

  user_data = <<-EOT
    #!/bin/bash
    dnf install -y httpd
    echo "<h1>${var.name}</h1>" > /var/www/html/index.html
    systemctl enable --now httpd
  EOT

  tags = {
    Name = "${var.name}-web"
  }
}
