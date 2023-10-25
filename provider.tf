provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = var.purge_soft_delete_on_destroy 
      recover_soft_deleted_key_vaults = var.recover_soft_deleted_key_vaults
    }
  }
}