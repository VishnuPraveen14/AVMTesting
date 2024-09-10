name = "bh14132"
resource_group_name = "rg-route"
location = "eastus"
ip_configuration = {
    name                 = "pubipbastion"
    subnet_id            = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/virtualNetworks/forbastionhost/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/publicIPAddresses/pubipbastion"
  }