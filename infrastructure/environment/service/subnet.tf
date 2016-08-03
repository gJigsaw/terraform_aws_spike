data "aws_availability_zones" "available" {}

resource "aws_subnet" "main" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${var.vpc_network_prefix}.0.0/24"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.main"]
    tags {Name = "${var.service_name}-subnet"}
}

resource "aws_subnet" "db1" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    cidr_block = "${var.vpc_network_prefix}.1.0/24"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.main"]
    tags {Name = "${var.service_name}-subnet"}
}

resource "aws_subnet" "db2" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    cidr_block = "${var.vpc_network_prefix}.2.0/24"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.main"]
    tags {Name = "${var.service_name}-subnet"}
}

resource "aws_route_table" "main" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main.id}"
    }
    tags {Name = "${var.service_name}-route_table"}
}

resource "aws_route_table_association" "main" {
    subnet_id = "${aws_subnet.main.id}"
    route_table_id = "${aws_route_table.main.id}"
}
