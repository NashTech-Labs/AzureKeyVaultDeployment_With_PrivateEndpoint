# deploy azure key vault with private endpoint connection

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_key_vault" "vault" {
  name                          = var.key_vault_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.rg.name
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled

  sku_name = var.sku_name

  network_acls {
    default_action = var.default_action
    bypass         = var.bypass
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id 

    key_permissions = var.key_permissions  #list of permissions to acesss keys in key vault

    secret_permissions = var.secret_permissions  #list of permissions to acesss secrets in key vault

    storage_permissions = var.storage_permissions  #list of permissions to acesss storage in key vault
  }
}


resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  private_service_connection {
    name                           = var.private_service_connection_name
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = azurerm_key_vault.vault.id
    subresource_names              = var.subresource_names
  }

  subnet_id = azurerm_subnet.subnet.id

}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  name                  = var.dns_vnet_link
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = var.registration_enabled
}