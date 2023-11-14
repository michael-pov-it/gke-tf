### Common variables
variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}
variable "region" {
  type        = string
  description = "The region to host the cluster in"
}
variable "env_name" {
  type        = string
  description = "The environment for the GKE cluster"
}

variable "network" {
  type        = string
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}
variable "subnetwork" {
  type        = string
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}
variable "ip_range_pods_name" {
  type        = string
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  type        = string
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}
