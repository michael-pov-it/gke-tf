data "google_client_config" "default" {
  depends_on = [module.gke]
}

module "gcp-network" {
  source     = "../_layers/core/network"
  project_id = var.project_id
  env_name   = var.env_name
  region     = var.region
}

module "gke" {
  source        = "../_layers/kubernetes/gke"
  cluster_name  = var.cluster_name
  project_id    = var.project_id
  region        = var.region
  env_name      = var.env_name
  network_name  = module.gcp-network.network_name
  subnets_names = module.gcp-network.subnets_names[0]
  depends_on = [
    module.gcp-network
  ]
}

module "gke_auth" {
  source       = "../_layers/kubernetes/auth"
  project_id   = var.project_id
  env_name     = var.env_name
  location     = module.gke.location
  cluster_name = module.gke.cluster_name
  depends_on = [
    module.gke
  ]
}

### Mail-Server SendGrid
module "mail-server" {
  source   = "../_layers/instances/mail-server"
  env_name = var.env_name
}

### DNS
module "dns-private-zone" {
  source     = "terraform-google-modules/cloud-dns/google"
  version    = "5.1.1"
  type       = "public"
  domain     = "gordievsky.work."
  name       = "gordievsky-work"
  project_id = var.project_id

  recordsets = [
    {
      name    = "nameserver"
      type    = "NS"
      ttl     = 300
      records = [
        "ns-cloud-d1.googledomains.com.",
        "ns-cloud-d2.googledomains.com.",
        "ns-cloud-d3.googledomains.com.",
        "ns-cloud-d4.googledomains.com.",
      ]
    },
    {
      name    = "localhost"
      type    = "A"
      ttl     = 300
      records = [
        "127.0.0.1",
      ]
    },
  ]
}
