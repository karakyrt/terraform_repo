variable "env" {
  type    = string
  default = "dev"
}

variable "snapshot" {
  type    = bool
  default = true
}

//overwrite files:
//dev.tfvars = env=dev snapshot = true
//qa.tfvars = env=qa snapshot = false