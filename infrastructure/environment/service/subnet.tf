resource "aws_subnet" "main" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${var.vpc_network_prefix}.${var.subnet_suffix}"
    availability_zone = "us-east-1b"
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
