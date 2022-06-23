# terraform apply -var-file playground.tfvars
env                 = "playground"
instance_ami        = "ami-0a1ee2fb28fe05df3"
instance_monitoring = false
webserver_count     = 2
database_servers    = ["playground-db-01", "playground-db-02"]