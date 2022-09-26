resource "azurerm_virtual_network" "diyotta-vnetwork" {
  name                = var.vnet_name
  address_space       = var.network_range
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "Subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.diyotta-vnetwork.name
  address_prefixes     = var.subnet_prefix
}

# Create public IPs
resource "azurerm_public_ip" "Diyotta_public_ip" {
  name                = "Diyotta-pub-IP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "Diyotta-NSG" {
  name                = "Diyotta-NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
# tags = {
#     environment = "Diyotta"
#   }
 }
}
 resource "azurerm_network_interface" "diyotta-NIC" {
  name                = var.NIC_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "IP"
    subnet_id                     = azurerm_subnet.Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Diyotta_public_ip.id
  }
}

 resource "azurerm_network_interface_security_group_association" "Diyotta-NSG-Association" {
  network_interface_id      = azurerm_network_interface.diyotta-NIC.id
  network_security_group_id = azurerm_network_security_group.Diyotta-NSG.id
}