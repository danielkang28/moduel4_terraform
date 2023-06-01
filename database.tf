
# # RDS
# # RDS Subnet Group
# resource "aws_db_subnet_group" "shopping-db-subnet-group" {
#   name        = "shopping-db-subnet-group"
#   description = "RDS subnet group for shopping-db"
#   subnet_ids  = module.vpc1.database_subnets
# }

# # RDS Instance
# resource "aws_db_instance" "shopping_db_instance" {
#   engine = "mysql"

#   engine_version = "8.0.32" // 버지니아 북부 : 8.0.32 / 서울 : 8.0.23 / 일본 : 
#   instance_class = "db.t2.micro"

#   allocated_storage     = 20
#   max_allocated_storage = 1000

#   # 모니터링 활성화
#   monitoring_interval = 60

#   // 로그 내보내기 활성화
#   enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery", "upgrade"]

#   storage_type = "gp2"
#   identifier   = "shopping"
#   db_name      = "shopping"
#   username     = "admin"
#   password     = "Pa$$w0rd"

#   vpc_security_group_ids = [aws_security_group.default-sg.id]
#   db_subnet_group_name   = aws_db_subnet_group.shopping-db-subnet-group.name

#   # Other configuration options (e.g., backup retention, maintenance window, etc.)
# }
 
