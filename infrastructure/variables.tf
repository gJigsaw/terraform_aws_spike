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

variable "app_image" {
    type = "string"
    description = "Docker image of app service"
    default = "gjigsaw/flask:20160803-0800"
}
