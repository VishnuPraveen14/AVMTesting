resource_group_name = "rg-route" # "<resource_group_name>"

private_link_services = {
  pls1 = {
    name                           = "privatelinkservice"   # "<private_link_service_name>"
    frontend_ip_config_name        = "LoadBalancerFrontEnd" # "<lb_frontend_name>"
    subnet_id                      = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/virtualNetworks/forbastionhost/subnets/default" # "<subnet_id>"
    private_ip_address             = null                    # "<private_ip_address>"
    private_ip_address_version     = "IPv4"                  # "<private_ip_address_version>"
    visibility_subscription_ids    = null                    # <["00000000-0000-0000-0000-000000000000"]>
    load_balancer_frontend_ip_configuration_ids = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/loadBalancers/mttest002/frontendIPConfigurations/LoadBalancerFrontEnd"] # <["00000000-0000-0000-0000-000000000000"]>
    auto_approval_subscription_ids = null
    enable_proxy_protocol          = false                   # <-- Add this attribute if needed
    lb_resource_group              = "rg-route"               # <-- Add this attribute if needed
    loadbalancer_name              = "mttest002"              # <-- Add this attribute if needed
    location                       = "East US"                # <-- Add this attribute if needed
    networking_resource_group      = "rg-route"          # <-- Add this attribute if needed
    pls_resource_group             = "rg-route"                 # <-- Add this attribute if needed
    subnet_name                    = "default"                # <-- Add this attribute if needed
    vnet_name                      = "forbastionhost"       # <-- Add this attribute if needed
  }
  # pls2 = {
  #   name                           = "privatelinkservice01"   # "<private_link_service_name>"
  #   frontend_ip_config_name        = "LoadBalancerFrontEnd" # "<lb_frontend_name>"
  #   subnet_id                      = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/virtualNetworks/forbastionhost/subnets/default" # "<subnet_id>"
  #   private_ip_address             = null                    # "<private_ip_address>"
  #   private_ip_address_version     = "IPv4"                  # "<private_ip_address_version>"
  #   visibility_subscription_ids    = null             # <["00000000-0000-0000-0000-000000000000"]>
  #   load_balancer_frontend_ip_configuration_ids = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/rg-route/providers/Microsoft.Network/loadBalancers/mttest002/frontendIPConfigurations/LoadBalancerFrontEnd"] # <["00000000-0000-0000-0000-000000000000"]>
  #   auto_approval_subscription_ids = null
  #   enable_proxy_protocol          = false                   # <-- Add this attribute if needed
  #   lb_resource_group              = "rg-route"               # <-- Add this attribute if needed
  #   loadbalancer_name              = "mttest002"              # <-- Add this attribute if needed
  #   location                       = "East US"                # <-- Add this attribute if needed
  #   networking_resource_group      = "rg-route"          # <-- Add this attribute if needed
  #   pls_resource_group             = "rg-route"                 # <-- Add this attribute if needed
  #   subnet_name                    = "default"                # <-- Add this attribute if needed
  #   vnet_name                      = "forbastionhost"       # <-- Add this attribute if needed
  # }
}

pls_additional_tags = {
  iac = "Terraform"
  env = "UAT"
}

