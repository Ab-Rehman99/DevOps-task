# Create Application Gateway
resource "azurerm_application_gateway" "main" {
  name                = "my-app-gateway"
  resource_group_name = azurerm_resource_group.application-rg.name
  location            = azurerm_resource_group.application-rg.location
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "app-gateway-ip-config"
    subnet_id = azurerm_subnet.gateway-subnet.id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "app-gateway-frontend-ip"
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name = "api-backend-pool"
    fqdns = [
      azurerm_linux_web_app.api1.default_hostname, azurerm_linux_web_app.api2.default_hostname
    ]
  }

  backend_http_settings {
    name                      = "app-gateway-http-settings"
    cookie_based_affinity     = "Disabled"
    port                      = 8080
    protocol                  = "Http"
    request_timeout           = 30
  }

  http_listener {
    name                                = "app-gateway-http-listener" # Match this name in the request_routing_rule block
    frontend_ip_configuration_name     = "app-gateway-frontend-ip"
    frontend_port_name                 = "http-port"
    protocol                           = "Http"
  }

  request_routing_rule {
    name                    = "api-routing-rule"
    rule_type               = "Basic"
    http_listener_name      = "app-gateway-http-listener"
    backend_address_pool_name = "api-backend-pool"
    backend_http_settings_name = "app-gateway-http-settings"
    priority                   = 100
  }
}
