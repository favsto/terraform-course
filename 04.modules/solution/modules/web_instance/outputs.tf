# outputs.tf

output "instance_internal_ips" {
  value = values(google_compute_instance.web_instances)[*].network_interface.0.network_ip
}