provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn = local.role_arns[var.env]
        session_name = var.env
#        external_id = local.external_id[var.env]
    }
}

locals {
    role_arns = {
        "dev" = "arn:aws:iam::161829588545:role/sts-admin-role"
#        "stage" = ""
#        "prod" = ""
#        "shared" = ""
    }
#    external_id = {
#        "dev" = "r8q####"
#        "stage" = ""
#        "prod" = ""
#        "shared" = ""
#    }
}

terraform {
    required_version = ">=0.12.6, < 1.14"
    required_providers {
        random = {
            source = "hashicorp/random"
            version = ">= 2.3.0"
        }
        null = {
            source = "hashicorp/null"
            version = "~> 2.1"
        }
        template = {
            source = "hashicorp/template"
            version = "~> 2.1"
        }
        aws = {
            source = "hashicorp/aws"
            version = ">= 2.7.0"
        }
    }
}

terraform {
    backend "s3" {
        bucket = "jana-s3-bucket"
        //  dynamodb_table = "dynamodb_name"
        acl = "bucket-owner-full-control"
        key = "terraform.tfstate"
        // workspace_key_prefix = "workspaces/tgrc-devops/cass-infra"
        region = "us-east-1"
        encrypt = true
    }
}