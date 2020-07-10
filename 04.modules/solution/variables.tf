# variables.tf

variable "gcp_project" {
  type        = string
  description = "The ID of the Google Cloud project"
}

variable "covered_zones" {
  type        = list(string)
  description = "A list of GCE zone names to deploy a GCE Web Instance"
}

variable "expose_instances" {
  type        = bool
  description = "If true, instances will have an external IP address"
  default     = true
}