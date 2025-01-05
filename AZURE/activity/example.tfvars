azurerm_resource_group = {
  name     = "ntier"
  location = "eastus"
  subscription_id="3529be14-e8d8-42e7-a938-5718795f09fc"
}
vnet_address_space = "10.0.0.0/16"
subnets = [{
  name          = "web"
  address_space = "10.0.0.0/24"
  }, {
  name          = "app"
  address_space = "10.0.1.0/24"
  }, {
  name          = "db"
  address_space = "10.0.2.0/24"
}]