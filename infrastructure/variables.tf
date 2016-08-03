variable "application_name" {
    type = "string"
    description = "Application name"
    default = "HelloWorld"
}

variable "region" {
    type = "string"
    description = "Amazon AWS region"
    default = "us-east-1"
}

variable "ami" {
    type = "string"
    description = "Amazon AMI to use as docker host"
}

variable "app_run_command" {
    type = "string"
    description = "Cloud config Command to run"
    default = "sudo docker run --detach --name app --publish 80:5000 gjigsaw/flask:20160803-0800\n"
}
