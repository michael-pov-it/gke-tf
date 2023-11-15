# provider "kubernetes" {
#   host                   = "https://${module.kubernetes.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }
