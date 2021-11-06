#resource "aws_efs_file_system" "this" {
#    encrypted = var.encrypted
#    performance_mode = var.performance_mode
#    creation_token = "${var.team}-${var.app}"
#    tags = merge(local.tags, map("Name", "${var.team}-${var.app}", "do_backup_efs", true))
#}

#resource "aws_efs_mount_target" "efs_mount_target" {
#    count = var.subnet_count
#    file_system_id = aws_efs_file_system.this.id
#    subnet_id = element(var.efs_subnet_ids, count.index)
#    security_groups = [aws_security_group.efs_sg.id]
#}