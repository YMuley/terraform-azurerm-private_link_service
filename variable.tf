variable "private_link_service_list" {
  type        = list(any)
  default     = []
  description = "private link service list"
}

variable "resource_group_output" {
  type        = map(any)
  default     = {}
  description = "resource group output"
}

variable "load_balancer_output" {
  type        = map(any)
  default     = {}
  description = "load balancer output"
}

variable "subnet_output" {
  description = "Map of subnet output"
  type        = map(any)
  default     = {}
}

variable "default_values" {
  type        = any
  default     = {}
  description = "Provide default values for resources if not any"
}
