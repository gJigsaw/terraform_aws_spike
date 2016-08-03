module "app" {
    source = "./service"
    instance_count = "2"
    service_name = "${var.environment_name}-app"
    deploy_key_name = "${aws_key_pair.deploy_key.key_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    vpc_network_prefix = "10.44"
    elb_health_check_target = "HTTP:80/"
    run_command = "${var.app_run_command}"
}
