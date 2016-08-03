resource "aws_elb" "main" {
    name = "${var.service_name}-elb"
    instances = ["${aws_instance.main.*.id}"]
    depends_on = ["aws_internet_gateway.main"]
    subnets = ["${aws_subnet.main.id}",]
    security_groups = [
        "${aws_security_group.elb.id}",
    ]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "${var.elb_health_check_target}"
        interval = 5
    }
    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400
    tags {Name = "${var.service_name}-elb"}
}

output "elb_dns_name" {value = "${aws_elb.main.dns_name}"}
