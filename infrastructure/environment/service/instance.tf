resource "template_file" "user_data" {
    template = <<END_OF_USER_DATA
#cloud-config
runcmd:
  - echo Cloud Config Start
  - ${run_command}
  - echo Cloud Config End
END_OF_USER_DATA
vars { run_command = "${var.run_command}" }
}

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
    user_data = "${template_file.user_data.rendered}"
    tags = {Name = "${var.service_name}-${count.index}"}
}
