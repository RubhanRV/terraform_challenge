#Webserver Info
output "websever_public_IP" {
    value = aws_instance.webserver01.public_ip
}

#RDS info
output "db_storage" {
  value = aws_db_instance.webserver_db01.allocated_storage
}
output "db_username" {
  value = aws_db_instance.webserver_db01.username
}
