variable "identifier" {
  default = "sugarush"
}

output "identifier" {
  value = "${var.identifier}"
}

variable "ansible_repo" {
  default = "git@github.com:sugarush/ansible.git"
}

output "ansible_repo" {
  value = "${var.ansible_repo}"
}

variable "key" {
  default = "sugarush"
}

variable "amis" {
  default = {
    #us-east-1 = "ami-366c8020"
    us-east-1 = "ami-9527cc83"
    us-west-1 = "ami-2cb3e74c"
    us-west-2 = "ami-000ed560"
  }
}

variable "account_id" {
  default = "652495891140"
}
