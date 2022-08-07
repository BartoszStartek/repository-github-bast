terraform {
  required_providers {
    name = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
     }
  }
}

provider "azurerm" {
  #client_id = ""
  #client_secret = ""
  #tenant_id = ""
  #subscription_id = "" 
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-apim"
  location = "West Europe"
}

resource "azurerm_api_management" "api" {
  name                = "apim-bast"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = "bast company"
  publisher_email     = "bartosz.startek@gmail.com"
  sku_name            = "Developer_1"
}

resource "azurerm_api_management_identity_provider_aad" "api_identity" {
  resource_group_name = azurerm_resource_group.example.name
  api_management_name = azurerm_api_management.example.name
  client_id           = "00000000-0000-0000-0000-000000000000"
  client_secret       = "00000000000000000000000000000000"
  allowed_tenants     = ["00000000-0000-0000-0000-000000000000"]
}