resource "template_file" "web_user_data" {
    template = "${file("${path.module}/user_data.tpl")}"
    vars {
        host = "${module.app.elb_dns_name}"
        image = "${var.web_image}"
    }
}

output "web_user_data" {value = "${template_file.web_user_data.rendered}"}


module "web" {
    source = "./service"
    service_name = "${var.environment_name}-web"
    deploy_key_name = "${aws_key_pair.deploy_key.key_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    vpc_network_prefix = "10.43"
    elb_health_check_target = "HTTP:80/styles/company.css"
    user_data = "${template_file.web_user_data.rendered}"
}

output "dns" {value = "${module.web.elb_dns_name}"}
