variable "checks" {
  default = {}
  type = map(object({
    fqdn                      = string
    port                      = number
    type                      = string
    resource_path             = string
    failure_threshold         = number
    request_interval          = number
    evaluation_periods        = number
    ok_actions                = list(string)
    alarm_actions             = list(string)
    insufficient_data_actions = list(string)
    tags                      = optional(map(string))
  }))
  description = "A map of health checks to create"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
