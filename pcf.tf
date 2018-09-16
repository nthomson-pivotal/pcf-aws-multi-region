module "pcf-1" {
  source = "github.com/nthomson-pivotal/pcf-paasify/terraform/aws"

  env_name     = "mr-use1"
  region       = "us-east-1"
  vpc_cidr     = "10.0.0.0/16"
  dns_suffix   = "${var.dns_suffix}"
  pivnet_token = "${var.pivnet_token}"
  tiles        = []
  auto_apply   = "0"
}

module "pcf-2" {
  source = "github.com/nthomson-pivotal/pcf-paasify/terraform/aws"

  env_name     = "mr-usw2"
  region       = "us-west-2"
  vpc_cidr     = "10.1.0.0/16"
  dns_suffix   = "${var.dns_suffix}"
  pivnet_token = "${var.pivnet_token}"
  tiles        = []
  auto_apply   = "0"
}
