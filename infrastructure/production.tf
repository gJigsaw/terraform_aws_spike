module "production" {
    source = "./environment"
    environment_name = "production-${var.application_name}"
    region = "${var.region}"
    ami = "${var.ami}"
    app_run_command = "${var.app_run_command}"
}

output "production_dns" {value = "${module.production.dns}"}
