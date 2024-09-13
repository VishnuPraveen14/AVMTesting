
enable_telemetry    = true
resource_group_name = "lumen-aks-rg-02"
location            = "EastUS2"
name                = "aks-02"
kubernetes_version  = "1.28"
node_cidr           = "10.48.0.0/16"
pod_cidr            = "192.168.0.0/16"
node_pools = {
    workload = {
      name                 = "workload"
      vm_size              = "Standard_D2d_v5"
      orchestrator_version = "1.28"
      max_count            = 110
      min_count            = 2
      os_sku               = "Ubuntu"
      mode                 = "User"
    }
  }
keyvault_name       = "AVD-GHAKS"
tenant_id           = "71695e40-f167-42cd-a8c7-143f394885ec"