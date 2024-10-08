
enable_telemetry    = true
resource_group_name = "lumen-avd-test-02"
location            = "EastUS2"
name                = "aks-02"
kubernetes_version  = "1.28"
node_cidr           = "10.31.0.0/16"
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
keyvault_name       = "lumen-aks-kv-02"
tenant_id           = "680f956b-1eaf-4bb1-a703-24b289ea568f"