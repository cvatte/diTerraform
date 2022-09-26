# Create (and display) an SSH key
# resource "tls_private_key" "diyotta-ssh" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# Create virtual machine
resource "azurerm_linux_virtual_machine" "Diyotta-vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.diyotta-NIC.id]
  size                  = "standard_b2ms"

  custom_data = filebase64("scripts/sample.sh")

  os_disk {
    name                 = var.os_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = var.computer_name
  admin_username                  = var.admin_username
  admin_password                  = var.admin_passwd
  disable_password_authentication = false

#   admin_ssh_key {
#     username   = "azureuser"
#     public_key = tls_private_key.diyotta-ssh.public_key_openssh
#   }

#   boot_diagnostics {
#     storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
#   }
}