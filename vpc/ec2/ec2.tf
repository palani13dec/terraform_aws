

resource "aws_instance" "pub_instance_01" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.pub_subnet_id}"
  user_data = "${file("userdata.sh")}"
  security_groups = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "Expert control server"
  }
}

resource "aws_instance" "app_instance_01" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.pri_subnet_id}"
  user_data = "${file("userdata.sh")}"
  security_groups = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "Expert control server"
  }
}
/*
#resource "template" "userdata" {
#    filename = "userdata.txt"
#}
*/
