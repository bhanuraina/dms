module "dms" {
    target = "./modules/dms_rds"
    
  
# Traget endpoint server inputs for 
target_engine               = "sqlserver"
target_database_host        = ""
target_database_name        = ""
target_database_username    = ""
target_database_password    = ""
target_port                 = ""

# Source endpoint server inputs
source_engine               = "sqlserver"
source_database_host        = ""
source_database_name        = ""
source_database_username    = ""
source_database_password    = ""
source_port                 = ""

# Tag

client                      = ""
description                 = ""
application                 = ""
environment                 = ""

#DMS replication Task variables

migration_type = "full-load-and-cdc"

replication_task_settings = ""





 
  
}