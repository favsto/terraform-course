# variables.tf
variable "gcp_project" {
  description = "The ID of the Google Cloud Platform project to use"
  type        = string
}

variable "service_accounts" {
  description = "The details of my Service Accounts to manage"
  type = map(object({
    name : string
    description : string
  }))
}