module "k8s_auth" {
  source               = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  version              = "29.0.0"
  project_id           = var.project_id
  location             = var.location
  cluster_name         = var.cluster_name
  use_private_endpoint = true
}
