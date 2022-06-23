# terraform apply -var-file playground.tfvars
env                 = "testing"
instance_ami        = "ami-0d71ea30463e0ff8d"
instance_monitoring = false
webserver_count     = 1
database_servers    = ["testing-db-01", "testing-db-02"]