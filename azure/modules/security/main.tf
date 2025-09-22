# Network Security Group for Web Tier
resource "azurerm_network_security_group" "web" {
  name                = "${var.project_name}-web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "HTTP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.vnet_cidr
    destination_address_prefix = "*"
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-web-nsg"
    Tier = "Web"
  })
}

# Network Security Group for App Tier
resource "azurerm_network_security_group" "app" {
  name                = "${var.project_name}-app-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "HTTP-from-Web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = var.public_subnet_cidr
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.vnet_cidr
    destination_address_prefix = "*"
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-app-nsg"
    Tier = "App"
  })
}

# Network Security Group for Database Tier
resource "azurerm_network_security_group" "database" {
  name                = "${var.project_name}-database-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "MySQL-from-App"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = var.private_subnet_cidr
    destination_address_prefix = "*"
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-database-nsg"
    Tier = "Database"
  })
}

# Associate NSG with Public Subnet
resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = azurerm_network_security_group.web.id
}

# Associate NSG with Private Subnet
resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = azurerm_network_security_group.app.id
}

# Associate NSG with Database Subnet
resource "azurerm_subnet_network_security_group_association" "database" {
  subnet_id                 = var.database_subnet_id
  network_security_group_id = azurerm_network_security_group.database.id
}
