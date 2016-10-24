variable "region" {
  default = "us-west-2"
}

output "region" {
  value = "${var.region}"
}


variable "identifier" {
  default = "sugarush"
}

output "identifier" {
  value = "${var.identifier}"
}

variable "ansible_repo" {
  default = "git@github.com:psev/ansible"
}

output "ansible_repo" {
  value = "${var.ansible_repo}"
}


variable "key" {
  default = "psev"
}

variable "amis" {
  default = {
    us-west-2 = "ami-000ed560"
  }
}
