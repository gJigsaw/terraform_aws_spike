variable "environment_name" {
    type = "string"
    description = "Environment name"
}

variable "region" {
    type = "string"
    description = "Amazon AWS region"
}

variable "ami" {
    type = "string"
    description = "Amazon AMI to use as docker host"
}

variable "app_run_command" {
    type = "string"
    description = "Cloud config Command to run"
}
