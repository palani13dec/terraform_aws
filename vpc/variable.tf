variable "vpc_cidr" {
	description = "vpc cidr block eg 10.20.0.0/16"
	default = "10.25.0.0/16"
}

variable "vpc_instance_tenancy" {
        description = "mention vpc instance tenance eg: defalut, dedicated or host"
        default = "default"
}

variable "pub_subnet_01" {
	description = "mention vpc instance tenance eg: defalut, dedicated or host"
	default = "10.25.1.0/24"
}

variable "pri_subnet_01" {
        description = "mention vpc instance tenance eg: defalut, dedicated or host"
        default = "10.25.2.0/24"
}

variable "az1" {
	description = "mention az1" 
        default = "us-east-1a"
}

variable "az2" {
        description = "mention az2"
        default = "us-east-1b"
}

variable "ami_id" {
 	description = "provide ami id "
	default  = "ami-035be7bafff33b6b6"
}
variable "instance_type" { 
	description = "instance type"
	default  = "m4.large"
}

