variable "gcp_project" {
  type = string
}

# variable "account_names" {
#   description = "Create service accounts with these names"
#   type        = list(string)
#   default     = [
#       "cherry-app", 
#       "peach-app", 
#       "strawberry-app"
#     ]
# }

variable "account_names" {
  description = "Create service accounts with these names"
  type        = map(string)
  default     = {
      "cherry-app" = "Cherry Application", 
      "peach-app" = "Peach Application", 
      "strawberry-app" = "Strawberry Application"
    }
}

variable "web_server_fw_rule" {
    type = map(
        list(string)
    )
    default = {
        tcp : [
            "80", 
            "8080", 
            "443"
        ],
        icmp : []
    }
}