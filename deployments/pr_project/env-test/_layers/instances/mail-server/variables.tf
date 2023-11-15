variable "service_account_id" {
    default = "mail-server-sa"
}

variable "instance_name" {
  default = "mail-server"
}

variable "env_name" {
  type        = string
  description = "The environment for the GKE cluster"
}
variable "isntance_zone" {
    default = "europe-west3-c"
}
