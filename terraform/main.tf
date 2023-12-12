terraform {
  required_version = ">= 0.12"

  backend "azurerm" {
    subscription_id      = "b8ee75a4-9052-406d-a746-d25384000b5f"
    resource_group_name  = "mario-tf-state"
    storage_account_name = "mariotfstate"
    container_name       = "tfstatefiles"
    key                  = "mario.dev.tfstate"
  }  
}

provider "azurerm" {
  subscription_id = "b8ee75a4-9052-406d-a746-d25384000b5f"
  features {}
}



variable "tags" {
  type        = map(string)
  default     = {
    Product: "Store"
    AppGroup: "Store"
    Environment: "Development"
    Team: "DevopsSAndA"
    Customer: "Relex"
    CostCenter: "ResearchAndDevelopment"
    ManagedBy: "Terraform"
    ManagedIn: "mario-terraform"
  }
}


resource "azurerm_resource_group" "example" {
  name     = "mario-rg2"
  location = "West Europe"
  tags = var.tags 
}
