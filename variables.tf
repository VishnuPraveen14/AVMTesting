
variable "rg_name" {
    description = "Rg name"
    type = string
  
}

variable "rg_location" {
  description = "The Azure location where the resources will be created"
  type        = string
  default     = "East US"
}

variable "law_resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "myResourceGroup"
}

variable "law_location" {
  description = "The Azure location where the resources will be created"
  type        = string
  default     = "East US"
}

variable "law_log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
  default     = "myLogAnalyticsWorkspace"
}

variable "law_sku" {
  description = "The SKU (pricing tier) of the Log Analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "law_retention_in_days" {
  description = "The retention period for logs in days"
  type        = number
  default     = 30
}

variable "law_name" {
    description = "Law name"
    type = string  
}

variable "aa_name" {
    description = "Law name"
    type = string  
}
