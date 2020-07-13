# variables.tf

variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
}

variable "name" {
  type        = string
  description = "The project unique name of the firewall rule"
}

variable "rule_details" {
  type = map(
    list(string)
  )
  description = "The map where the key is the protocol, the value is a list of ports (as a string)"
}

variable "target_tags" {
  type        = list(string)
  description = "The list of tags this firewall rule belongs to"
}

variable "source_ranges" {
  type        = list(string)
  description = "The list of source CIDR as a string"
}
