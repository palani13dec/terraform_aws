
module "vpc" {
	source 			= "./vpc"
        vpc_cidr 		= "${var.vpc_cidr}"
        vpc_instance_tenancy    = "${var.vpc_instance_tenancy}"
        pub_subnet_01           = "${var.pub_subnet_01}"
        pri_subnet_01           = "${var.pri_subnet_01}"
        az1                     = "${var.az1}"
        az2                     = "${var.az2}"
}

module "ec2" {
	source                 = "./ec2"
        ami_id                 = "${var.ami_id}"
        instance_type          = "${var.instance_type}"
        pub_subnet_id          = "${module.vpc.pub_sub_id}"
        pri_subnet_id          = "${module.vpc.pri_sub_id}"
        vpc_id                 = "${module.vpc.vpc_id}"
}
