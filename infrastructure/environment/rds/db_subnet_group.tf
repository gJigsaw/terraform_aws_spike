resource "aws_db_subnet_group" "main" {
    name = "${var.instance_name}"
    description = "Our Main RDS subnet group"
    subnet_ids = ["${var.primary_db_subnet}", "${var.secondary_db_subnet}"]
}