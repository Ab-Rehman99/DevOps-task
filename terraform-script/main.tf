terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.97.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "d0dc2c28-831d-44bd-986c-f58b884385f0"
  tenant_id       = "f62bbecb-db55-423f-8a58-75d6f869e3fc"
  client_id       = "48c3d6dc-a781-4caf-bbc4-53321e07e992"
  client_secret   = var.client_secret
}

resource "azurerm_resource_group" "application-rg" {
  location = var.resource_group_location
  name     = var.application_rg_name
}

resource "azurerm_resource_group" "shared-rg" {
  location = var.resource_group_location
  name     = var.shared_rg_name
}
