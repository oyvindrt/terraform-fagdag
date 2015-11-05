resource "aws_vpc" "my_vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    
	depends_on = [
		"aws_vpc.my_vpc"
	]
}

resource "aws_subnet" "my_subnet" {
    vpc_id                  = "${aws_vpc.my_vpc.id}"
    cidr_block              = "10.0.0.0/24"
    map_public_ip_on_launch = true
	availability_zone		= "eu-west-1a"
    
    depends_on = [
        "aws_internet_gateway.my_igw"
    ]
}

resource "aws_route_table" "my_route_table" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.my_igw.id}"
    }
}

resource "aws_main_route_table_association" "my_main_route_table_association" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    route_table_id = "${aws_route_table.my_route_table.id}"
}

resource "aws_security_group" "my_security_group" {
    name        = "my_security_group"
    vpc_id      = "${aws_vpc.my_vpc.id}"

    ingress {
        from_port = "80"
        to_port   = "80"
        protocol  = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

    ingress {
        from_port = "3000"
        to_port   = "3000"
        protocol  = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

    ingress {
        from_port = "5000"
        to_port   = "5000"
        protocol  = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

    egress {
        from_port = "0"
        to_port   = "0"
        protocol  = "-1"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    depends_on = [
        "aws_subnet.my_subnet",
    ]
}