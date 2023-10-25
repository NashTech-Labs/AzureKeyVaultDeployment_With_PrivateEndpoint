
output "key_vault_name" {
  value = azurerm_key_vault.vault.name
}

output "private_dns_zone_name" {
  value = azurerm_private_dns_zone.example.name
}

output "private_endpoint_name" {
  value = azurerm_private_endpoint.example.name
}

