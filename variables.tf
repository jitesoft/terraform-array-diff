variable "list1" {
  description = "List to diff with list2"
  type        = "list"
}

variable "list2" {
  description = "List to diff with list1"
  type        = "list"
}

variable "shell" {
  description = "Shell to use. Defaults to Bash."
  type        = "string"
  default     = "bash"
}
