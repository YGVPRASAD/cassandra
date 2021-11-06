#data "aws_acm_certificate" "soa-cert" {
#    domain = "*.${var.domain_name}"
#    statuses = ["ISSUED"]
#}

#data "aws_wafregional_rule" "security_team" {
#    name = "tgrc_managed_allow_cargill_ips_rule"
#}

#data "aws_wafregional_rule" "managedIPs_wafrule" {
#    name = "tgrc_devops_managedIPs_wafrule"
#}

#data "aws_security_group" "cargill_managed_sg" {
#    vpc_id = var.vpc_id
#
#    tags = {
#        Name = "common_${var.env}_Cargill_managedIPs"
#        AppEnvironment = var.env
#    }
#}