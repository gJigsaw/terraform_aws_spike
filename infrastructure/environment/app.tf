resource "template_file" "app_user_data" {
    template = <<END_OF_USER_DATA
#cloud-config
runcmd:
  - echo Cloud Config Start
  - sudo docker run --detach --name app --publish 80:5000 ${image}
  - echo Cloud Config End
END_OF_USER_DATA
    vars {
        image = "${var.app_image}"
    }
}

output "app_user_data" {value = "${template_file.app_user_data.rendered}"}


module "app" {
    source = "./service"
    instance_count = "2"
    service_name = "${var.environment_name}-app"
    deploy_key_name = "${aws_key_pair.deploy_key.key_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    vpc_network_prefix = "10.44"
    elb_health_check_target = "HTTP:80/"
    user_data = "${template_file.app_user_data.rendered}"
}
