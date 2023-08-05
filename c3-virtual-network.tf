# Create Virtual Network

data "azurerm_virtual_network" "myvnet" {
  name                = "my-vnet"
  resource_group_name = "${data.azurerm_resource_group.myrg.name}"
  }

# Create Subnet
data "azurerm_subnet" "mysubnet" {
  name                 = "my-sub_01"
 resource_group_name = "${data.azurerm_resource_group.myrg.name}"
  virtual_network_name = "${data.azurerm_virtual_network.myvnet.name}"
 }

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = "${data.azurerm_resource_group.myrg.name}"
  location            = "${data.azurerm_resource_group.myrg.location}"
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name                = "vmnic"
  resource_group_name = "${data.azurerm_resource_group.myrg.name}"
  location            = "${data.azurerm_resource_group.myrg.location}"
 
  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${data.azurerm_subnet.mysubnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
}
