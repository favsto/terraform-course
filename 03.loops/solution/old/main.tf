# resource "google_service_account" "tfc_service_account" {
#   for_each = toset(var.account_names)

#   account_id   = each.value
#   display_name = each.value
# }

resource "google_service_account" "tfc_service_account" {
  for_each = var.account_names

  account_id   = each.key
  display_name = each.value
}

resource "google_compute_instance" "tfc_instance_tags" {
  name         = "tagged-instance"
  machine_type = "f1-micro"
  zone         = "europe-west4-b"

  tags = ["web-server-rules"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo su
    apt update
    apt install -y apache2
    EOT
}

# resource "google_compute_firewall" "web-server" {
#   name    = "web-server-fw"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "8080", "443"]
#   }

#   allow {
#     protocol = "icmp"
#   }

#   target_tags = ["web-server-rules"]
# }

resource "google_compute_firewall" "web-server" {
  name    = "web-server-fw"
  network = "default"

  dynamic "allow" {
      for_each = var.web_server_fw_rule

      content {
          protocol = allow.key
          ports = allow.value
      }
  }

  target_tags = ["web-server-rules"]
}