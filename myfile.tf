module "terraform-aws-vpc" {
  source = "github.com/cloudposse/terraform-aws-vpc"

  default_network_acl_deny_all              = true
  ipv6_egress_only_internet_gateway_enabled = true
  network_address_usage_metrics_enabled     = true
  delimiter                                 = ","
}
