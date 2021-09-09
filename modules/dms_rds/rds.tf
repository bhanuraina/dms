#==============================================================
# Database / rds.tf
#==============================================================

# Create a target RDS instance

resource "aws_db_instance" "target" {
  identifier              = "${var.stack_name}-${var.environment}-${var.identifier}-target"
  allocated_storage       = "${var.target_storage}"
  engine                  = "${var.target_engine}"
  engine_version          = "${var.target_engine_version}"
  instance_class          = "${var.target_instance_class}"
  name                    = "${var.target_db_name}"
  username                = "${var.target_username}"
  password                = "${var.target_password}"
  vpc_security_group_ids  = ["${aws_security_group.rds.id}"]
  multi_az                = "${var.target_rds_is_multi_az}"
  db_subnet_group_name    = "${aws_db_subnet_group.rds-subnet.id}"
  backup_retention_period = "${var.target_backup_retention_period}"
  backup_window           = "${var.target_backup_window}"
  maintenance_window      = "${var.target_maintenance_window}"
  storage_encrypted       = "${var.target_storage_encrypted}"

  # Skip final snapshot for environments that don't start with 'p'
  # e.g. for environments that aren't 'prod'
  skip_final_snapshot = "${replace(replace(var.environment, "/^[^p].*/", "1"),"/^p.*$/", "0")}"

  tags {
    Name        = "${var.stack_name}_rds_target"
    owner       = "${var.owner}"
    stack_name  = "${var.stack_name}"
    environment = "${var.environment}"
    created_by  = "terraform"
  }
}

resource "postgresql_database" "my_db1" {
  name              = "my_db1"
  owner             = "my_role1"
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
  depends_on = [aws_db_instance.default]
}

resource "postgresql_role" "my_role1" {
  name     = "my_role1"
  login    = true
  password = "mypass"
}

resource "postgresql_database" "my_db" {
  name              = "my_db"
  owner             = "my_role"
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}

resource "postgresql_role" "my_role" {
  name     = "my_role"
  login    = true
  password = "mypass"
}

 terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.13.0"
    }
  }
}

provider "postgresql" {
  host = "${aws_db_instance.default.address}"
  username = "${aws_db_instance.default.username}"
  password = "${aws_db_instance.default.password}"
  superuser = false
}
