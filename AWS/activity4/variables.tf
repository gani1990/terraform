variable "region" {
  type    = string
  default = "ap-south-1"


}

variable "security_group_name" {
  type    = string
  default = "rds"

}

variable "db_instance_size" {
  type    = string
  default = "db.t3.micro"

}

variable "db_storage_size" {
  type    = number
  default = 20



}


variable "db_info" {
  type = object({
    engine   = optional(string, "mysql")
    public   = optional(bool, false)
    username = optional(string, "gani")
    password = optional(string, "ganidevops")
  })
}
