resource "azurerm_application_insights" "application_insights" {
  name                = "my-application-insights"
  location            = azurerm_resource_group.shared-rg.location
  resource_group_name = azurerm_resource_group.shared-rg.name
  application_type    = "web"

#   tags = merge(
#     local.tags,
#     { "hidden-link:/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${local.linuxwebappname}" = "Resource" }
#   )
}

