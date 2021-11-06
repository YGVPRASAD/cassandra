locals {
    volume_tags = {
        Team = var.team
        AppEnvironment = var.env
        AppName = var.app
        ITOwnerEmail = "durgajana2011@gmail.com"
        BillingCode = "XXXXXXXX"
        DataClassification = "Highly Restricted"
        TaggingVersion = "0.0.1"
        Name = "${var.app}-${var,env}-${var.tag}"
        Backup = var.do_backup
    }
}

locals {
    tags = {
        Team = var.team
        AppEnvironment = var.env
        AppName = var.app
        ITOwnerEmail = "durgajana2011@gmail.com"
        BillingCode = "XXXXXXXX"
        DataClassification = "Highly Restricted"
        TaggingVersion = "0.0.1"
    }
}