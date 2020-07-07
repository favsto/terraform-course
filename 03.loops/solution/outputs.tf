# outputs.tf
output "account_email" {
  description = "My service account e-mail addresses"
  value       = values(google_service_account.tfc_service_account)[*].email
}