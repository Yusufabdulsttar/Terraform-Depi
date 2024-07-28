variable "region" {
  type    = string 
  default = "us-east-1"
}

variable "AMI" {
  type    = string 
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  type    = string 
  default = "t2.micro"
}

variable "cidr_block_vpc" {
  type    = string 
  default = "10.0.0.0/16"
}

variable "cidr_block_Public_subnet" {
  type    = string 
  default = "10.0.1.0/24"
}