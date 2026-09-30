variable "name" {
  description = "リソースの名前の先頭に付ける文字（例: tfawsops-dev）"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]{3,32}$", var.name))
    error_message = "name は英小文字・数字・ハイフンで3〜32文字にしてください。"
  }
}

variable "cidr" {
  description = "VPC のアドレスの範囲（例: 10.10.0.0/16）"
  type        = string

  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "cidr は 10.10.0.0/16 のような形で書いてください。"
  }
}

variable "tags" {
  description = "すべてのリソースに付ける共通のタグ（v1.1.0 で追加。既定は空）"
  type        = map(string)
  default     = {}
}
