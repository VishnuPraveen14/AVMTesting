name                 = "vm14"
location             = "East US"
network_interfaces = {
  network_interface_1 = {
    name = "testnic2"
    ip_configurations = {
      ip_configuration_1 = {
        name                          = "Ipv4config"
        private_ip_subnet_resource_id = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-vm/providers/Microsoft.Network/virtualNetworks/vnet-eastus/subnets/snet-eastus-1"
        # private_ip_address            = "10.0.0.4"  # Uncomment if needed
        # public_ip_address             = "20.0.0.4"  # Uncomment if needed
      }
    }
   # primary = true  # Optional, include if needed
  }
}

zone                 = "1"
resource_group_name  = "rg-vm"
