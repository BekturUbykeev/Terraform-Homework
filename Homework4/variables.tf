variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"  
}


variable "key_name" {
  description = "SSH key name"
  type        = string
  default     = "Bastion"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  type        = string
  default     = "us-east-2a"
}

variable "ami_id" {
  default = "ami-0884d2865dbe9de4b"
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default = "HelloWorld"
}

variable instance_type {
  default = "t2.micro"
}

variable port {
  type = list
  default = [22, 80, 443]
}