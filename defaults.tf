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
    us-east-1 = "ami-9527cc83"
    us-west-2 = "ami-b01da3d0"
  }
}

variable "account_id" {
  default = "652495891140"
}
