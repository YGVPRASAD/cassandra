#### Security Group for APP
resource "aws_security_group" "app_sg" {
    name = "app-sg-${var.app}"
    description = "Allow inbound traffic and outbound traffic"
    vpc_id = var.vpc_id
    tags = merge(local.tags, map("Name", "app-sg-${var.app}"))
}
resource "aws_security_group_rule" "ingress_app_sg" {
    type = "ingress"
    protocol = "tcp"
    from_port = "443"
    to_port = "443"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["10.0.0.0/8"]
}
resource "aws_security_group_rule" "ingress_app_sg1" {
    type = "ingress"
    protocol = "tcp"
    from_port = "22"
    to_port = "22"
    security_group_id = aws_security_group.app_sg.id
    self = true
}
resource "aws_security_group_rule" "ingress_app_sg2" {
    type = "ingress"
    protocol = "tcp"
    from_port = "5222"
    to_port = "5222"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["10.0.0.0/8"]
}
resource "aws_security_group_rule" "ingress_app_sg3" {
    type = "ingress"
    protocol = "tcp"
    from_port = "7000"
    to_port = "7000"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["10.0.0.0/8"]
}
resource "aws_security_group_rule" "ingress_app_sg4" {
    type = "ingress"
    protocol = "tcp"
    from_port = "9042"
    to_port = "9042"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["10.0.0.0/8"]
}
resource "aws_security_group_rule" "ingress_app_sg5" {
    type = "ingress"
    protocol = "tcp"
    from_port = "80"
    to_port = "80"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["10.0.0.0/8"]
}
resource "aws_security_group_rule" "egress_app_sg" {
    type = "egress"
    protocol = "-1"
    from_port = "0"
    to_port = "0"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks = ["0.0.0.0/0"]
}