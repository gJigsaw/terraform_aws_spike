output "instance_id" { value = "${aws_db_instance.main_instance.id}" }
output "instance_address" { value = "${aws_db_instance.main_instance.address}" }
output "subnet_group_id" { value = "${aws_db_subnet_group.main_db_subnet_group.id}" }
