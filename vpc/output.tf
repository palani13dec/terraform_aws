output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.equalexpert_vpc.id}"
}
output "pub_sub_id" {
  description = "The ID of the public subnet"
  value       = "${aws_subnet.expert-pub-subnet-01.id}"
}

output "pri_sub_id" {
  description = "The ID of the private subnet"
  value       = "${aws_subnet.expert-pri-subnet-01.id}"
}

