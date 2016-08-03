resource "aws_db_instance" "main" {
    identifier = "${var.instance_name}"
    username = "${var.database_user}"
    password = "${var.database_password}"

    instance_class = "db.m3.medium"
    name = "MyRDS"
    engine = "mysql"
    engine_version = "5.6.29"
    storage_type = "standard"
    parameter_group_name = "default.mysql5.6"
    allocated_storage = "10"
    multi_az = "true"
    
    vpc_security_group_ids = ["${var.security_group_id}"]
    
    db_subnet_group_name = "${aws_db_subnet_group.main.name}"
}
