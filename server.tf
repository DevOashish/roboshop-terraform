module "servers" {
  for_each = var.components

  source = "./module"
  components_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")
  
}











































# data "aws_security_group" "allow-all" {
#   name = "allow-all"

# }

# resource "aws_instance" "instance" {
#   for_each = var.components
#   ami = data.aws_ami.centos.image_id
#   instance_type = each.value["instance_type"]
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]


#   tags = {
#     Name = each.value["name"]
#   }
#   }

# resource "null_resource" "provisioner" {
#   depends_on = [aws_instance.instance, aws_route53_record.records]

#   for_each = var.components
  
#   provisioner "remote-exec" {


#   connection {
#     type     = "ssh"
#     user     = "centos"
#     password = "DevOps321"
#     host     = aws_instance.instance[each.value["name"]].private_ip
#   }


#     inline = [
#       "rm -rf roboshop-shell",
#       "git clone https://github.com/DevOashish/roboshop-shell.git ",
#       "cd roboshop-shell",
#       "sudo bash ${each.value["name"]}.sh ${lookup(each.value, "password" ,"null")}"
#     ]
#   }
# }

# resource "aws_route53_record" "records" {
#   for_each               = var.components
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "${each.value["name"]}-dev.devoash.tech"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.instance[each.value["name"]].private_ip]
# }




















# # data "aws_ami" "centos" {
# #   most_recent      = true
# #   owners           = ["973714476881"]
# #     name_regex       = "Centos-8-DevOps-Practice"


# # }


# # variable "components" {}
# #   default = {
# #     frontend = {
# #       name          = "frontend"
# #       instance_type = "t3.small"
# #     }
# #     mongodb = {
# #       name          = "mongodb"
# #       instance_type = "t3.small"
# #     }
# #     catalogue = {
# #       name          = "catalogue"
# #       instance_type = "t3.micro"
# #     }
# #     redis = {
# #       name          = "redis"
# #       instance_type = "t3.small"
# #     }
# #     user = {
# #       name          = "user"
# #       instance_type = "t3.micro"
# #     }
# #     cart = {
# #       name          = "cart"
# #       instance_type = "t3.micro"
# #     }
# #     mysql = {
# #       name          = "mysql"
# #       instance_type = "t3.small"
# #     }
# #     shipping = {
# #       name          = "shipping"
# #       instance_type = "t3.medium"
# #     }
# #     rabbitmq = {
# #       name          = "rabbitmq"
# #       instance_type = "t3.small"
# #     }
# #     payment = {
# #       name          = "payment"
# #       instance_type = "t3.small"
# #     }
# #   }
# # }



# # resource "aws_instance" "instance" {
# #   for_each = var.components
# #   ami = data.aws_ami.centos.image_id
# #   instance_type = each.value["instance_type"]
# #   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]


# #   tags = {
# #     Name = each.value["name"]
# #   }
# #   }


