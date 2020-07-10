# main.tf 

# a random id valid for my deploy. It will be saved in the state
resource "random_id" "instance_id" {
  byte_length = 8
}

# some local values
locals {
  vm_name           = "vm-${random_id.instance_id.hex}"
  http_fw_rule_name = "default-allow-http-${random_id.instance_id.hex}"
  http_tag_name     = "http-server-${random_id.instance_id.hex}"
  icmp_fw_rule_name = "default-allow-icmp-${random_id.instance_id.hex}"
  icmp_tag_name     = "ping-${random_id.instance_id.hex}"
}

# a group of web instances
module "web_instance" {
  source = "./modules/web_instance"

  project_id   = var.gcp_project
  name         = local.vm_name
  zones        = var.covered_zones
  network_tags = [local.http_tag_name]
  is_exposed   = var.expose_instances
}

# a firewall rule to allow HTTP traffic form everywhere
module "http_rule" {
  source = "./modules/fw_tagged_rule"

  project_id = var.gcp_project
  name       = local.http_fw_rule_name

  rule_details = {
    tcp : [
      "80",
      "8080",
      "443"
    ]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [local.http_tag_name]
}

# a firewall rule to allow PING traffic form everywhere
module "icmp_rule" {
  source = "./modules/fw_tagged_rule"

  project_id = var.gcp_project
  name       = local.icmp_fw_rule_name

  rule_details = {
    icmp : []
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [local.icmp_tag_name]
}