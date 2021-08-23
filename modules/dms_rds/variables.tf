variable "subnets" {
  type        = list(string)
  description = "List of Subnets"
}
variable "environment" {
  description = "Environment like dev, staging, prod"
}

#--------------------------------------------------------------
# DMS source config
#--------------------------------------------------------------
variable "source_engine" {
  description = "Database engine to migrate"
}
variable "source_database_host" {
  description = "Database host to migrate"
}
variable "source_database_name" {
  description = "Source database"
}
variable "source_database_username" {
  description = "Source database user"
}
variable "source_database_password" {
  description = "Source database password"
}
variable "source_port" {
 description = "Source database port"
}

variable "application" {
  description = "Client application"
}

variable "client" {
  description = "Client name"
}

variable "ssl_mode" {
  description = "Enable SSL encryption"
}

#--------------------------------------------------------------
# DMS target config
#--------------------------------------------------------------

variable "target_backup_retention_period" {
  # Days
  default     = "30"
  description = "Retention of RDS backups"
}

variable "target_backup_window" {
  # 12:00AM-03:00AM AEST
  default     = "14:00-17:00"
  description = "RDS backup window"
}

variable "target_database_name" {
  description = "Name of the target database"
}

variable "target_database_port" {
  description = "The port the Application Server will access the database on"
  default     = 5432
}

variable "target_engine" {
  default     = "sqlserver"
  description = "Engine type, example values mysql, postgres"
}

variable "target_engine_version" {
  description = "Engine version"
  default     = "9.3.14"
}

variable "target_instance_class" {
  default     = "db.t3.micro"
  description = "Instance class"
}

variable "target_maintenance_window" {
  default     = "Mon:00:00-Mon:03:00"
  description = "RDS maintenance window"
}

variable "target_password" {
  description = "Password of the target database"
}

variable "target_rds_is_multi_az" {
  description = "Create backup database in separate availability zone"
  default     = "false"
}

variable "target_storage" {
  default     = "10"
  description = "Storage size in GB"
}

variable "target_storage_encrypted" {
  description = "Encrypt storage or leave unencrypted"
  default     = false
}

variable "target_username" {
  description = "Username to access the target database"
}


variable "replication_task_settings" {
  description = "replication task settings"
}

variable "migration_type" {
  type = "string"
  description = "task type settings"
  default = "full-load-and-cdc"
}

variable "storage_size" {
  default = "30"
  description = "Replication task storage"
}
variable "dms_engine_version" {
  description = "Data migration service engine version"
}
variable "publicly_accessible" {
  description = "True if you want DMS instance to be accessible publicly"

}
variable "instance_type" {
  description = "Migration instance type"
}