/*

module "db" {
    source = "./rds"
    instance_name = "${var.environment_name}"
    database_user = "my_user"
    database_password = "my_password"
    security_group_id = "bad_sg"
    primary_db_subnet = 
    secondary_db_subnet = 
}

output "rds_instance_id" { value = "${module.db.instance_id}" }
output "rds_instance_address" { value = "${module.db.instance_address}" }
output "rds_subnet_group_id" { value = "${module.db.subnet_group_id}" }

*/
