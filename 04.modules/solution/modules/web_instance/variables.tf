# variables.tf

variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
}

variable "name" {
  type        = string
  description = "The name of the GCE instance"
}

variable "zones" {
  type        = set(string)
  description = "The GCE zones list where the GCE instances are located"
}

variable "network_tags" {
  type        = list(string)
  description = "The list of tags this instance must have"
}

variable "is_exposed" {
  type        = bool
  description = "Whether the instance will have an external IP address or not"
  default     = false
}