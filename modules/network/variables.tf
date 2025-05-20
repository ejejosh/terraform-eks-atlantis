variable "vpc_name" {
  description = "VPC Name"
  type        = string
}
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "Public Subnet CIDRs"
  type        = list(string)
}
