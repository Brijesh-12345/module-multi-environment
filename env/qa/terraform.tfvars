env        = "qa"
app_name  = "webapp"

ami            = "ami-0b6c6ebed2801a5cb"
instance_type  = "t2.micro"
key_name       = "terra-key"

asg_min     = 2
asg_max     = 3
asg_desired = 2

db_username = "admin"
db_password = "QaPassword123!"
