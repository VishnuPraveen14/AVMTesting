terraform {
    backend "remote" {
    storage_account_name = "vishnudemo9934"
    container_name      = "test"
    key                 = "terraform.tfstate"
    subscription_id      = "ce326908-2fd8-4d82-aa1f-106533ca8b6a" 
  }
}