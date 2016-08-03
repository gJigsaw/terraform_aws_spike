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

variable "web_image" {
    type = "string"
    description = "Docker image of web service"
}

variable "app_image" {
    type = "string"
    description = "Docker image of app service"
}
