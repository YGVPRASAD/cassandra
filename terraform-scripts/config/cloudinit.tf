data "template_file" "init-script" {
    template = file("../scripts/${var.app}/init.tpl")
    vars = {
        appname2 = var.app
        env2 = var.env
        DEVICE = var.device
        MOUNT_POINT = var.mount_point
    }
}

data "template_file" "cw_data" {
    template = file("../scripts/${var.app}/cwlog.tpl")

    vars = {
        app = var.app
    }
}

data "template_cloudinit_config" "cloudinit-example" {
    gzip = false
    base64_encode = false

    part {
        content_type = "text/x-shellscript"
        content = data.template_file.init-script.rendered
    }
    part {
        content_type = "text/x-shellscript"
        content = data.template_file.cw_data.rendered
    }
    #part {
    #    content_type = "text/x-shellscript"
    #    content =  file("../scripts/${var.app}/bootstrap.sh")
    #}
}