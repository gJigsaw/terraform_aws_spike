resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_network_prefix}.${var.vpc_network_suffix}"
    enable_dns_hostnames = true
    tags {Name = "${var.service_name}-vpc"}
}
