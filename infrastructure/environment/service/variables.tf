variable "service_name" {
    type = "string"
    description = "Service name"
}

variable "instance_count" {
    type = "string"
    description = "Number of instances to create"
    default = "2"
}

variable "region" {
    type = "string"
    description = "Amazon AWS region"
}

variable "ami" {
    type = "string"
    description = "Amazon AMI to use as docker host"
}

variable "deploy_key_name" {
    type = "string"
    description = "Name of SSH deploy key"
}

variable "vpc_network_prefix" {
    type = "string"
    description = "First two octets of VPC network"
}

variable "vpc_network_suffix" {
    type = "string"
    description = "Last two octets of VPC network and bitmask count"
    default = "0.0/16"
}

variable "elb_health_check_target" {
    type = "string"
    description = "URL that ELB should use for health checks"
    default = "HTTP:80/"
}

variable "run_command" {
    type = "string"
    description = "cloud config command to run"
}
