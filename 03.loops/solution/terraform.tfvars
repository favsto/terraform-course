#terraform.tfvars
gcp_project = "injenia-lab-gcp-demo"

# account_names = [
#   "cherry-app",
#   "peach-app",
#   "strawberry-app"
# ]

service_accounts = {
  cherry-app = {
    name        = "Cherry App"
    description = "This is the account for Cherry App"
  },
  peach-app = {
    name        = "Peach App"
    description = "This is the account for Peach App"
  },
  strawberry-app = {
    name        = "Strawberry App"
    description = "This is the account for Strawberry App"
  },
}