
variable "client_secret" {
  type = string
  sensitive = true
}

variable "OS_TYPE" {
  type = string
  default = "Linux"
}
variable "WEBAPP_PLAN_NAME_1" {
  type = string
  default = "NETApi-plan1"
}
variable "WEBAPP_PLAN_NAME_2" {
  type = string
  default = "NETApi-plan2"
}
variable "WEBAPPNAME1" {
  type = string
  default = "abdul-api-1"
}
variable "WEBAPPNAME2" {
  type = string
  default = "abdulll-api-2"
}


variable "resource_group_location" {
  default     = "uaenorth"
  description = "Location of the resource group."
}

variable "application_rg_name" {
  description = "Name of the application resource group"
  type        = string
  default = "application-rg"
}

variable "shared_rg_name" {
  description = "Name of the shared resource group"
  type        = string
  default = "shared-rg"
}

# variable "admin_username" {
#   type        = string
#   description = "The administrator username of the SQL server."
#   default     = "azureadmin"
# }
# variable "admin_password" {
#   type        = string
#   description = "The administrator password of the SQL server."
#   sensitive   = true
#   default     = "Reddeadredemption2"
# }

variable "SKU_NAME_1" {
  type = string
  default = "F1"
}
variable "SKU_NAME_2" {
  type = string
  default = "B1"
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL server."
  default     = "azureadmin"
}
variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL server."
  sensitive   = true
  default     = "Reddeadredemption2"
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
  default     = "SampleDB"
}