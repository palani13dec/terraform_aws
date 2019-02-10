resource "aws_vpc" "equalexpert_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_instance_tenancy}"

  tags = {
    Name = "expert-vpc"
  }
}


resource "aws_internet_gateway" "expert_gw" {
  vpc_id = "${aws_vpc.equalexpert_vpc.id}"
}

resource "aws_eip" "eip" {
  vpc      = true
}


resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.expert-pub-subnet-01.id}"
  depends_on    = ["aws_internet_gateway.expert_gw"]
  tags = {
    Name = "expert-NAT-gateway"
  }
}



resource "aws_subnet" "expert-pub-subnet-01" {
  vpc_id     = "${aws_vpc.equalexpert_vpc.id}"
  cidr_block = "${var.pub_subnet_01}"
  availability_zone = "${var.az1}"

  tags = {
    Name = "expert-pub-subnet-01"
  }
}
resource "aws_subnet" "expert-pri-subnet-01" {
  vpc_id     = "${aws_vpc.equalexpert_vpc.id}"
  cidr_block = "${var.pri_subnet_01}"
  availability_zone  = "{var.az2}"

  tags = {
    Name = "expert-pri-subnet-01"
  }
}



resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.equalexpert_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.expert_gw.id}"
  }


  tags = {
    Name = "expert-public-route"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = "${aws_vpc.equalexpert_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }


  tags = {
    Name = "expert-public-route"
  }
}

resource "aws_route_table_association" "pub_associate" {
  subnet_id      = "${aws_subnet.expert-pub-subnet-01.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "pri_associate" {
  subnet_id      = "${aws_subnet.expert-pri-subnet-01.id}"
  route_table_id = "${aws_route_table.private_route.id}"
}

