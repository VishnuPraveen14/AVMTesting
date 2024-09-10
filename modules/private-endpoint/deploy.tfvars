resource_group_name = "rg-route"

# Azure Subscription ID
subscription_id = "05a4028e-14a9-4f7d-baf3-2629d5a430bc"

# Virtual Network Details
virtual_network_rg   = "rg-route"
virtual_network_name = "forbastionhost"
pe_subnet_name       = "default"

# Private Endpoints Configuration
private_endpoints = {
  "pe1" = {
    name                           = "private-endpoint-1"
    private_connection_resource_id = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Storage/storageAccounts/stg1313"
    subresource_names              = ["blob"]
    is_manual_connection           = true
    request_message                = "Please approve this private endpoint connection."
    private_dns_zone_group_name    = "my-private-dns-zone-group"
    private_dns_zone_ids           = [
      "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/privateDnsZones/test.exapmle.com"
    ]
  }
}

# Tags
tags = {
  Environment = "production"
  Department  = "IT"
  Project     = "PrivateEndpointDeployment"
}
