resource "aws_instance" "app" {
    count = var.instance_count
    ami = var.ami
    instance_type = var.instance_type
    iam_instance_profile = aws_iam_instance_profile.instance_profile.id
    subnet_id = element(distinct(compact(concat([var.subnet_id], var.subnet_ids))), count.index, )
    vpc_security_group_ids = [aws_security_group.app_sg.id}"]
    associate_public_ip_address = true
    key_name = var.key_name
    user_data = data.template_cloudinit_config.cloudinit-example.rendered
    volume_tags = merge(local.volume_tags, map("Name", "${var.app}-${var.tag}-${var.env}${count.index + 1}"))
    root_block_device {
        volume_type           = "gp3"
        volume_size           = "25"
        delete_on_termination = "true"
    }
    
    tags = merge(local.tags, map("Name", "${var.app}-element(var.name_prefixes, count.index)${count.index + 1}-${var.tag}-${var.env}"))
}