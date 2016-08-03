variable "application_name" {
    type = "string"
    description = "Application name"
    default = "companyNews"
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

variable "web_image" {
    type = "string"
    description = "Docker image of web service"
    default = "gjigsaw/cn-web:20160417-1900"
}

variable "app_image" {
    type = "string"
    description = "Docker image of app service"
    default = "gjigsaw/cn-app:20160417-1900"
}
