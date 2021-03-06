terraform {
  backend "s3" {
    bucket = "letslearn-terraform"
    key    = "network/state"
    region = "eu-central-1"
  }
}

provider "aws" {
  region  = "eu-central-1"
  version = "~> 2.3"
}

locals {
  owner = "letslearn"
}

module "network_tools" {
  source = "base"

  owner                   = "${local.owner}"
  vpc_name                = "tools"
  vpc_cidr_block          = "172.20.0.0/16"
  avaibility_zones_number = "2"

  extra_tags = {}
}
