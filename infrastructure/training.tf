module "training" {
    source = "./environment"
    environment_name = "training-${var.application_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    web_image = "${var.web_image}"
    app_image = "${var.app_image}"
}

output "training_dns" {value = "${module.training.dns}"}
