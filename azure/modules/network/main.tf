# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-vnet"
  })
}

# Public Subnet (Web Tier)
resource "azurerm_subnet" "public" {
  name                 = "${var.project_name}-public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.public_subnet_cidr]
}

# Private Subnet (App Tier)
resource "azurerm_subnet" "private" {
  name                 = "${var.project_name}-private-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.private_subnet_cidr]
}

# Database Subnet
resource "azurerm_subnet" "database" {
  name                 = "${var.project_name}-database-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.database_subnet_cidr]

  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

# Public IP for NAT Gateway
resource "azurerm_public_ip" "nat_gateway" {
  name                = "${var.project_name}-nat-gateway-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat-gateway-pip"
  })
}

# NAT Gateway
resource "azurerm_nat_gateway" "main" {
  name                    = "${var.project_name}-nat-gateway"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat-gateway"
  })
}

# Associate Public IP with NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "main" {
  nat_gateway_id       = azurerm_nat_gateway.main.id
  public_ip_address_id = azurerm_public_ip.nat_gateway.id
}

# Associate NAT Gateway with Private Subnet
resource "azurerm_subnet_nat_gateway_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  nat_gateway_id = azurerm_nat_gateway.main.id
}

# Route Table for Private Subnet
resource "azurerm_route_table" "private" {
  name                = "${var.project_name}-private-rt"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-rt"
  })
}

# Associate Route Table with Private Subnet
resource "azurerm_subnet_route_table_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  route_table_id = azurerm_route_table.private.id
}
