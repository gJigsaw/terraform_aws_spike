resource "aws_key_pair" "deploy_key" {
    key_name = "${var.environment_name}-deploy_key" 
    public_key = "${file("${path.module}/ssh/dummy_rsa.pub")}"
}
