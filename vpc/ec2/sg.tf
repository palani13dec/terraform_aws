resource "aws_security_group" "sg" {
  name        = "common-sg"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"
}
