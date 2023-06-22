data "aws_ami" "centos" {
  most_recent      = true
  owners           = ["973714476881"]
    name_regex       = "Centos-8-DevOps-Practice"


}

data "aws_security_group" "allow-all" {
  name = "allow-all"

}

 output "aws_security_group" {
    value = data.aws_security_group.allow-all


variable "instance_type" {
  default = "t3.micro"
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z006270827E18HEX0RQPW"
  name    = "frontend-dev.devoash.tech"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "frontend" {
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]


  }



  tags = {
    Name = "frontend"
  }
}
############################################################################################
resource "aws_instance" "cart" {
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  


  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z006270827E18HEX0RQPW"
  name    = "cart-dev.devoash.tech"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart.private_ip]
}

##########################################################################################

resource "aws_instance" "catalogue" {
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z006270827E18HEX0RQPW"
  name    = "catalogue-dev.devoash.tech"
  type    = "A"
  ttl     = 300
  records = [aws_instance.catalogue.private_ip]
}

###############################################################################

# resource "aws_instance" "user" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "user"
#   }
# }

# resource "aws_route53_record" "user" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "user-dev.devoash.tech"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.user.private_ip]
# }

# #############################################################################

# resource "aws_instance" "mysql" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "mysql"
#   }
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "mysql-dev.devoash.tech"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.mysql.private_ip]
# }

# #############################################################################

# resource "aws_instance" "mongodb" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "mongodb"
#   }
# }

# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "mongodb-dev.devoash.tech"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.mongodb.private_ip]
# }

# ############################################################################

# resource "aws_instance" "rabbitmq" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "rabbitmq"
#   }
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "rabbitmq-dev.devoash.tech"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.rabbitmq.private_ip]
# }

# ###########################################################################

# resource "aws_instance" "payment" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "payment"
#   }
# }

# resource "aws_route53_record" "payment" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "payment-dev.devoash.tech"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.payment.private_ip]
# }

# #############################################################################

# resource "aws_instance" "shipping" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "shipping"
#   }
# }

# resource "aws_route53_record" "shipping" {
#   zone_id = "Z006270827E18HEX0RQPW"
#   name    = "shipping-dev.devoash.tech"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.shipping.private_ip]
# }
# ###############################################################################

# # resource "aws_instance" "web" {
# #   ami = data.aws_ami.centos.image.id
# #   instance_type = var.instance_type

# #   tags = {
# #     Name = "HelloWorld"
# #   }
# # }

# # resource "aws_instance" "web" {
# #   ami = data.aws_ami.centos.image.id
# #   instance_type = var.instance_type

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "aws_instance" "web" {
#   ami = data.aws_ami.centos.image.id
#   instance_type = var.instance_type

#   tags = {
#     Name = "HelloWorld"
#   }
# }