
variable "resource_group_name" {
  type = string
  default = "key-vault"
}

variable "location" {
  type = string         
  default = "eastus"
}

variable "virtual_network_name" {
  type = string
  default = "vnet-keyvault"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type = string
  default = "key-vault-subnhet"
}

variable "address_prefixes" {
  default = ["10.0.1.0/24"]
}

variable "key_vault_name" {
  type = string
  default = "your-vault-8790"
}

variable "enabled_for_disk_encryption" {
  type = bool
  default = true
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
}

variable "purge_protection_enabled" {
  type = bool
  default = false
}

variable "public_network_access_enabled" {
  type = bool
  default = false
}

variable "sku_name" {
  description = "sku name of key vault"
  type = string
  default = "standard"
}

variable "default_action" {
  description = "default action of network_acls"
  type = string
  default = "Allow"
}

variable "bypass" {
  description = "bypass value of network_acls"
  type = string
  default = "AzureServices"
}



variable "secret_permissions" {
  type = list(string)
  default = [ 
      "Set",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover"
   ]
}

variable "key_permissions" {
  type = list(string)
  default = [ 
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover"
   ]
}

variable "storage_permissions" {
  type = list(string)
  default = [ 
      "Set",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover"
   ]
}

variable "private_dns_zone_name" {
  type = string
  default = "privatelink.vaultcore.azure.net"
}

variable "private_endpoint_name" {
  type = string
  default = "example-keyvault-endpoint"
}

variable "private_service_connection_name" {
  type = string
  default = "example-keyvault-connection"
}

variable "is_manual_connection" {
  type = bool
  default = false
}

variable "subresource_names" {
  type = list(string)
  default = [ "vault" ]
}

variable "dns_vnet_link" {
  type = string
  default = "dns-link-example"
}

variable "registration_enabled" {
  type = bool
  default = true
}

variable "purge_soft_delete_on_destroy" {
  type = bool
  default = true
}

variable "recover_soft_deleted_key_vaults" {
  type = bool
  default = true
}








