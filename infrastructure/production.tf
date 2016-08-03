module "production" {
    source = "./environment"
    environment_name = "production-${var.application_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    app_image = "${var.app_image}"
}

output "production_dns" {value = "${module.production.dns}"}
