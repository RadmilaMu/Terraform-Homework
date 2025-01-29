 terraform {
   backend "s3" {
     bucket = "hm-bucket5"
     key    = "terraform.tfstate"
     region = "us-east-1"
     dynamodb_table = "lock-state"
   }
 }

