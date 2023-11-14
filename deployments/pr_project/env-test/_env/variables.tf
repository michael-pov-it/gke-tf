### TFC variables
variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}
variable "region" {
  type        = string
  description = "The region to host the cluster in"
}
variable "zone" {
  type        = string
  description = "The zone to host the cluster in"
}
variable "env_name" {
  type        = string
  description = "The environment for the GKE cluster"
}
variable "cluster_name" {
  type        = string
  description = "The name for the GKE cluster"
}

### Cluster variables
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
variable "zones" {
  type        = list(string)
  description = "The project ID to host the cluster in"
  default     = ["europe-west3-a", "europe-west3-b"]
}

### Creds
variable "GOOGLE_CREDENTIALS" {
  default = ""
}
