output "account_email" {
  value       = google_service_account.tfc_service_account
  description = "My service accounts"
}

output "all_emails" {
  value = values(google_service_account.tfc_service_account)[*].email
}