data "aws_ami" "centos" {
    owners = ["973714476881"]
    most_recent = true
    name_regex = "Centos-8-DevOps-Practice"
  
}

data "aws_security_group" "allow_all" {
  name = "allow-all"
}

variable "instance_type" {
   default = "t3.micro"
}

variable "components" {
   default = ["frontend","mongodb","catalogue"]
}


resource "aws_instance" "instance" {
  count = length(var.components)
  ami = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow_all.id]

  tags = {
    Name = var.components[count.index]
  }
}

# resource "aws_instance" "mongodb" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "mongodb"
#   }
# }

# resource "aws_instance" "catalogue" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "catalogue"
#   }
# }

# resource "aws_instance" "Redis" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "Redis"
#   }
# }

# resource "aws_instance" "user" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "user"
#   }
# }

# resource "aws_instance" "cart" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "cart"
#   }
# }

# resource "aws_instance" "MySQL" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "MySQL"
#   }
# }

# resource "aws_instance" "shipping" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "shipping"
#   }
# }

# resource "aws_instance" "RabbitMQ" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "RabbitMQ"
#   }
# }

# resource "aws_instance" "Payment" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "Payment"
#   }
# }

# resource "aws_instance" "Dispatch" {
#   ami = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow_all.id]

#   tags = {
#     Name = "Dispatch"
#   }
# }


resource "aws_route53_record" "frontend" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "frontend-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.frontend.private_ip] 
}

resource "aws_route53_record" "mongodb" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "mongodb-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.mongodb.private_ip] 
}

resource "aws_route53_record" "catalogue" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "catalogue-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.catalogue.private_ip]
}

resource "aws_route53_record" "Redis" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "Redis-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.Redis.private_ip]
}

resource "aws_route53_record" "user" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "user-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.user.private_ip]
}


resource "aws_route53_record" "cart" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "cart-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.cart.private_ip]
}

resource "aws_route53_record" "MySQL" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "MySQL-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.MySQL.private_ip]
}

resource "aws_route53_record" "shipping" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "shipping-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.shipping.private_ip]
}

resource "aws_route53_record" "RabbitMQ" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "RabbitMQ-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.RabbitMQ.private_ip]
}

resource "aws_route53_record" "Payment" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "Payment-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.Payment.private_ip]
}

resource "aws_route53_record" "Dispatch" {
 zone_id = "Z05651432BEIDAOZH30YR"
 name = "Dispatch-dev.devopsr72.online"
 type = "A"
 ttl = 30
 records = [aws_instance.Dispatch.private_ip]
}