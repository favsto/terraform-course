# outputs.tf

output "instance_internal_ips" {
  value = module.web_instance.instance_internal_ips
}