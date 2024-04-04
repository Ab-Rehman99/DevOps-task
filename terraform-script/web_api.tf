### To Create the Azure Webapp Plan ################
resource "azurerm_service_plan" "webplan1" {
  name                = var.WEBAPP_PLAN_NAME_1
  location            = azurerm_resource_group.application-rg.location
  resource_group_name = azurerm_resource_group.application-rg.name
  os_type             = var.OS_TYPE
  sku_name            = var.SKU_NAME_1
  
}
resource "azurerm_service_plan" "webplan2" {
  name                = var.WEBAPP_PLAN_NAME_2
  location            = azurerm_resource_group.application-rg.location
  resource_group_name = azurerm_resource_group.application-rg.name
  os_type             = var.OS_TYPE
  sku_name            = var.SKU_NAME_2
  
}
### To Create the Azure Webapp Service ################
# create web app1
resource "azurerm_linux_web_app" "api1" {
  name                = var.WEBAPPNAME1
 resource_group_name = azurerm_resource_group.application-rg.name
  location            = azurerm_resource_group.application-rg.location
  service_plan_id     = azurerm_service_plan.webplan1.id

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY         = azurerm_application_insights.application_insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING  = azurerm_application_insights.application_insights.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }

  site_config {
    always_on = false
    application_stack {
      dotnet_version              = "7.0" # currently only allows 3.1, 6.0, 7.0
    }
  }
}
resource "azurerm_linux_web_app" "api2" {
  name                = var.WEBAPPNAME2
  resource_group_name = azurerm_resource_group.application-rg.name
  location            = azurerm_resource_group.application-rg.location
  service_plan_id     = azurerm_service_plan.webplan2.id

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY         = azurerm_application_insights.application_insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING  = azurerm_application_insights.application_insights.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }

  site_config {
    always_on = false
    application_stack {
      dotnet_version              = "7.0" # currently only allows 3.1, 6.0, 7.0
    }
  }
}