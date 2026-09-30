variable "name" {
  description = "リソースの名前の先頭に付ける文字（例: tfawsops-dev）"
  type        = string
}

variable "vpc_id" {
  description = "サーバーを置く VPC の ID"
  type        = string
}

variable "subnet_id" {
  description = "サーバーを置くサブネットの ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 のインスタンスタイプ（無料プランの対象の t3.micro を既定にする）"
  type        = string
  default     = "t3.micro"
}
