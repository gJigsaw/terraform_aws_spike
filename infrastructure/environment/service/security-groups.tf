resource "aws_security_group" "elb" {
    name = "${var.service_name}-elb-sg"
    description = "Allow anything out and http[s] in from anywhere"
    vpc_id = "${aws_vpc.main.id}"
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {Name = "${var.service_name}-elb-sg"}
}

resource "aws_security_group" "instance" {
    name = "${var.service_name}-instance-sg"
    description = "Allow anything out and http[s] in from the ELB"
    vpc_id = "${aws_vpc.main.id}"
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.elb.id}",]

    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${aws_security_group.elb.id}",]
    }
    tags {Name = "${var.service_name}-instance-sg"}
}

resource "aws_security_group" "debug" {
    name = "${var.service_name}-debug-sg"
    description = "Allow SSH and http[s] in from anywhere"
    vpc_id = "${aws_vpc.main.id}"
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {Name = "${var.service_name}-debug-sg"}
}
