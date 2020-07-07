# main.tf
resource "google_service_account" "tfc_service_account" {
  for_each = var.service_accounts

  account_id   = each.key
  display_name = each.value.name
  description  = each.value.description
}
