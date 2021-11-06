variable "region" {
    default = " "
}
variable "vpc_id" {
    default = " "
}
#variable "subnet_ids" {
#    description = "EC2 subnets"
#    type = list
#}
variable "subnet_id" {
    description = "The VPC Subnet ID to launch in"
    type = string
    default = ""
}
variable "ami" {
    default = " "
}
variable "instance_type" {
    default = " "
}
variable "key_name" {
    default = " "
}
variable "target_group_name" {
    default = " "
}
variable "instance_count" {
    default = " "
}
variable "env" {
    default = " "
}
variable "app" {
    default = " "
}
variable "path" {
    default = " "
}
variable "team" {
    default = " "
}
#variable "vpc_zone_identifier" {
#    description = "A list of subnet IDs to launch resources in"
#    type = list(string)
#    default = []
#}
variable "tag" {
    default = " "
}
variable "name_prefixes" {
    default = " "
}
variable "target_acct_role_arn" {
    default = " "
}
variable "target_acct_ext_id" {
    default = " "
}
variable "cr_no" {
    default = " "
}
variable "subnets" {
    default = " "
}
variable "domain_name" {
    default = " "
}
variable "http_port" {
    default = "80"
}
variable "https_ports" {
    default = ["80", "443"]
}
#variable "standard_tags" {
#    type = "map"
#}
variable "cidr_blocks" {
    type = list
}
variable "device" {
    default = " "
}
variable "mount_point" {
    default = " "
}
variable "do_backup" {
    default = " "
}