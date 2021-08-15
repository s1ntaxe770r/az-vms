variable "username" {
  type    = string
  default = "enderdragon"
}

variable "size" {
  type    = string
  default = "Standard_A1_v2"
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string 
}

variable "tenant_id" {
  type = string
}

variable "ssh_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}
