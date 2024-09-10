module "resourceGroup" {
  source  = "./modules/resourceGroup"
  name = var.rg_name
  location = var.rg_location
}

module "LogAnalyticsWorkspace" {
    source = "./modules/log-analytics-workspace"
    name = var.law_name
    location= var.law_location
    resource_group_name = var.law_resource_group_name
    sku = var.law_sku
    retention_in_days = var.law_retention_in_days
    depends_on = [ module.resourceGroup ]
}








resource "random_id" "id" {
  byte_length = 4
}

resource "azurerm_user_assigned_identity" "management" {
  location            = var.rg_location
  name                = "id-terraform-${random_id.id.hex}"
  resource_group_name = var.rg_name

  depends_on = [
    module.resourceGroup
  ]
}

module "automationaccount" {
  source = "./modules/automation-account"

  automation_account_name      = var.aa_name
  location                     = var.rg_location
  resource_group_name          = var.rg_name


  automation_account_identity = {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.management.id]
  }

  automation_account_local_authentication_enabled  = true
  automation_account_public_network_access_enabled = true
  automation_account_sku_name                      = "Basic"
  linked_automation_account_creation_enabled       = true


  log_analytics_workspace_allow_resource_only_permissions    = true
  log_analytics_workspace_cmk_for_query_forced               = true
  log_analytics_workspace_daily_quota_gb                     = 1
  log_analytics_workspace_internet_ingestion_enabled         = true
  log_analytics_workspace_internet_query_enabled             = true
  log_analytics_workspace_reservation_capacity_in_gb_per_day = 200
  log_analytics_workspace_retention_in_days                  = 50
  log_analytics_workspace_sku                                = "CapacityReservation"
  resource_group_creation_enabled                            = false

  tags = {
    environment = "dev"
  }
  depends_on = [
    azurerm_user_assigned_identity.management,
  ]
}


module "lawsolution" {
  source = "./modules/loganalytics-solutions"

  location                     = var.rg_location
  resource_group_name          = var.rg_name
  log_analytics_workspace_name = module.LogAnalyticsWorkspace.log_analytics_workspace["name"]

  read_access_id               = module.automationaccount.aut_act_id
  workspace_id                 = module.LogAnalyticsWorkspace.log_analytics_workspace["id"]

  linked_automation_account_creation_enabled       = true

  log_analytics_solution_plans = [
    {
      product   = "OMSGallery/AgentHealthAssessment"
      publisher = "Microsoft"
    },
    {
      product   = "OMSGallery/AntiMalware"
      publisher = "Microsoft"
    },
    {
      product   = "OMSGallery/ChangeTracking"
      publisher = "Microsoft"
    },
    {
      product   = "OMSGallery/ContainerInsights"
      publisher = "Microsoft"
    },
    {
      product   = "OMSGallery/Security"
      publisher = "Microsoft"
    },
    {
      product   = "OMSGallery/SecurityInsights"
      publisher = "Microsoft"
    }
  ]

  tags = {
    environment = "dev"
  }
}
