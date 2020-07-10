# main.tf

resource "google_compute_firewall" "fw_rule" {
  name    = var.name
  network = "default" # intentionally left static

  dynamic "allow" {
    for_each = var.rule_details

    content {
      protocol = allow.key
      ports    = allow.value
    }
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}