resource "aws_instance" "main" {
    count = "${var.instance_count}"
    subnet_id = "${aws_subnet.main.id}"
    ami = "${var.ami}"
    instance_type = "t2.micro"
    security_groups = [
        "${aws_security_group.instance.id}",
        "${aws_security_group.debug.id}",
    ]
    key_name = "${var.deploy_key_name}"
/*
    connection {
        user = "ubuntu"
        key_file = "../ssh/${var.deploy_key_name}"
    }
    provisioner "remote-exec" {
        inline = [
            "echo This will only work when SecGrps allow SSH",
        ]
    }
*/
    user_data = "${var.user_data}"
    tags = {Name = "${var.service_name}-${count.index}"}
}
