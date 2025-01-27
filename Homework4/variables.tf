
variable region {
    default = "us-east-2"
    type = string 
    description = "Provide a region"
}

variable key_name {
    default = "bastion-key"
    type = string
  
}

variable port {
    type = list
    default = [22, 80, 443]
  
}

variable availability_zone {
    default = "us-east-2a" 
    type = string
}
 variable instance_type {
    default = "t2.micro"
    type = string
   
 }

 variable AMI_Id {
    default = "ami-0eb070c40e6a142a3"  
    type = string
 }

variable instance_name {
    default = "hm4"
    type = string
  
}
