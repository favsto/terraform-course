# outputs.tf

output "rule_id" {
  value = google_compute_firewall.fw_rule.id
}