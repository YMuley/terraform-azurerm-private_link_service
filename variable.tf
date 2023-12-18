variable "private_link_service_list" {
  type        = list(any)
  default     = []
  description = "private link service list"
}

variable "nat_ip_configuration" {
  type    = list(any)
  default = []
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
  type        = map(any)
  default     = {}
  description = "subnet output"
}

variable "default_values" {
  type        = any
  default     = {}
  description = "Provide default values for resources if not any"
}
