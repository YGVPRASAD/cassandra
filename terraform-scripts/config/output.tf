output "Instance_ID" {
    description = "Name of the EC2"
    value = aws_instance.app.*.id
}
output "Instance_PrivateIP" {
    description = "EC2 Private IP"
    value = aws_instance.app.*.private_ip
}
############EFS################
#output "efs_id" {
#    description = "Id of the EFS file system"
#    value = aws_efs_file_system.this.id
#}
#
#output "efs_dns_name" {
#    description = "List of DNS mount poimts, one per subnet"
#    value = [aws_efs_mount_target.efs_mount_target.*.dns_name]
#}
#
#output "mount_target_ips" {
#    description = ""
#    value = coalescelist(aws_efs_mount_target.efs_mount_target.*.ip_address, [""])
#    description = "List of EFS mount target IPs (one per Availability Zone)"
#}
#output "amazon_linux_cloudinit_config_part" {
#    description = "Cloud init part to mount an EFS to an EC2 instance"
#    value = {
#        content_type = "text/cloud-boothook"
#        content = data.template_file.amazon_linux_cloud_init_part.rendered
#    }
#}