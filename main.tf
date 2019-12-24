

data "aws_caller_identity" "current" {}

 module "tfstate_backend" {
   source        = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=master"
   namespace     = "tlz-demo"
   stage         = "dev"
   name          = var.bucket_name
   attributes    = ["state",data.aws_caller_identity.current.account_id]
   region        = var.region
 }
