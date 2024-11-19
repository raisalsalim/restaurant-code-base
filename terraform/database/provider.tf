
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.10.0"  # Specify provider version in the required_providers block
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8735ab23-01bd-4ecd-b27e-9cf23f97545c"  # Your Azure subscription ID
}
