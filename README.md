# Terraform Deployment for Azure Key Vault with Private Endpoint Connection:

This Terraform script allows you to deploy an Azure Key Vault with a private endpoint connection in Microsoft Azure.

## Prerequisites:

Before you begin, make sure you have the following:

1. Terraform installed on your local machine.
2. Azure CLI configured with the necessary access to create Azure resources.
3. Azure subscription where you want to deploy the Key Vault.
4. Customize the variables.tf file with your desired configuration.

## Configuration:

Customize the variables.tf file to specify your configuration options. This includes:

**resource_group_name:** The name of the Azure resource group where the Key Vault will be deployed.<br>  
**location:** The Azure region where the resource group and Key Vault will be created.<br>  
**virtual_network_name:** The name of the Azure Virtual Network.<br>  
**address_space:** The address space for the Virtual Network.<br>  
**subnet_name:** The name of the subnet within the Virtual Network.<br>  
**address_prefixes:** The address prefix for the subnet.<br>  
**key_vault_name:** The name of the Azure Key Vault.<br>  
**enabled_for_disk_encryption:** Enable or disable disk encryption.<br>  
**soft_delete_retention_days:** The number of days to retain soft-deleted keys and secrets.<br>  
**purge_protection_enabled:** Enable or disable purge protection.<br>  
**public_network_access_enabled:** Enable or disable public network access to the Key Vault.<br>  
**sku_name:** The SKU name for the Key Vault.<br>  
**default_action:** The default action for network access control.<br>  
**bypass:** List of bypass options for network access control.<br>  
**key_permissions:** List of permissions to access keys in the Key Vault.<br>  
**secret_permissions:** List of permissions to access secrets in the Key Vault.<br>  
**storage_permissions:** List of permissions to access storage in the Key Vault.<br>  
**private_dns_zone_name:** The name of the private DNS zone.<br>  
**private_endpoint_name:** The name of the private endpoint.<br>  
**private_service_connection_name:** The name of the private service connection.<br> 
**is_manual_connection:** Set to true for a manual connection.<br>  
**subresource_names:** List of subresource names.<br>  
**dns_vnet_link:** The name of the DNS virtual network link.<br>  
**registration_enabled:** Enable or disable DNS registration.<br>  

## Deployment:

1. Initialize your Terraform configuration by running:

**terraform init**

2. Review the execution plan to ensure it matches your intended changes:

**terraform plan**

3. Apply the configuration to create the Azure Key Vault and associated resources:

**terraform apply**

4. Confirm the deployment by typing "yes" when prompted.

## Cleanup

To remove the deployed resources, run:

**terraform destroy**

## Additional Information:

For more information about Terraform and Azure resources, refer to the Terraform documentation.

Feel free to reach out if you have any questions or need assistance with this deployment script. Happy coding!
