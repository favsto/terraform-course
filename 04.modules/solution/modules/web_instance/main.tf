# main.tf

resource "google_compute_instance" "web_instances" {
  for_each = var.zones

  name         = "${var.name}-${each.value}"
  machine_type = "f1-micro"
  zone         = each.value

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Hello from Terraform in ${each.value}!</h1></body></html>' | sudo tee /var/www/html/index.html"

  network_interface {
    network = "default"

    dynamic "access_config" {
      for_each = var.is_exposed ? [""] : []

      content {

      }
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = var.network_tags
}