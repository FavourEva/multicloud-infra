# Web Tier Security Group
resource "aws_security_group" "web" {
  name_prefix = "${var.project_name}-web-"
  vpc_id      = var.vpc_id
  description = "Security group for web tier"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-web-sg"
    Tier = "Web"
  })

  lifecycle {
    create_before_destroy = true
  }
}

# App Tier Security Group
resource "aws_security_group" "app" {
  name_prefix = "${var.project_name}-app-"
  vpc_id      = var.vpc_id
  description = "Security group for app tier"

  ingress {
    description     = "HTTP from Web Tier"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-app-sg"
    Tier = "App"
  })

  lifecycle {
    create_before_destroy = true
  }
}

# Database Tier Security Group
resource "aws_security_group" "database" {
  name_prefix = "${var.project_name}-db-"
  vpc_id      = var.vpc_id
  description = "Security group for database tier"

  ingress {
    description     = "MySQL from App Tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-database-sg"
    Tier = "Database"
  })

  lifecycle {
    create_before_destroy = true
  }
}
