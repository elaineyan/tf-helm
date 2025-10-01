terraform {
  required_version = ">= 1.0"
}

variable "prefix" { default = "demo" }

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "${ var.prefix }-vpc" }  
}

output "vpc_id" { value = aws_vpc.main.id }
