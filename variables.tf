variable "environment" {
  type        = string
  default     = ""
  description = "Environment (dev/stg/pro)"
}

variable "project" {
  type        = string
  default     = ""
  description = "Project (eng/saas)"
}

variable "workload" {
  type        = string
  default     = ""
  description = "Workload"
}

variable "tf_config" {
  type        = string
  default     = ""
  description = "Terraform configuration name"
}

variable "enable" {
  type        = bool
  default     = true
  description = "Enables GuardDuty. Setting this to false will suspend it"
}

variable "finding_publishing_frequency" {
  type        = string
  default     = "SIX_HOURS"
  description = "Frequency of findings publishing"
}

#variable "email" {
#  type        = string
#  default     = ""
#  description = "Email to notify SNS events"
#}