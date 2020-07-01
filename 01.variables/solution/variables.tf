variable "no_type" {
}

variable "a_string" {
  type = string
}

variable "a_number" {
  type = number
}

variable "a_bool" {
  type = bool
}

variable "a_list" {
  type        = list(string)
  description = "this list contains strings"
}

variable "a_set" {
  type        = set(string)
  description = "this set contains unique strings"
}

variable "a_map" {
  type        = map(number)
  description = "keys are strings, values are numbers"
}

variable "item" {
  type        = tuple([string, string, number])
  description = "this is a shopping item"
}

variable "person" {
  type = object({
    name    = string
    surname = string
    age     = number
  })
  description = "this is a person"
}

variable "shopping_list" {
  type        = list(tuple([string, string, number]))
  description = "this is a shopping list"
}