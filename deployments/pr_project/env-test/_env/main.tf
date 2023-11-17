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
### GKE Resources
# resource "kubernetes_pod" "apache-dev" {
#   metadata {
#     name = "apache-dev-pod"

#     labels = {
#       maintained_by = "terraform"
#       app           = "apache-dev"
#     }
#   }

#   spec {
#     container {
#       image = "ubuntu/apache2:latest"
#       name  = "apache-dev"
#     }
#   }

#   depends_on = [module.gke]
# }

# resource "kubernetes_service" "apache-dev" {
#   metadata {
#     name = "apache-dev-svc"
#   }

#   spec {
#     selector = {
#       app = kubernetes_pod.apache-dev.metadata[0].labels.app
#     }

#     session_affinity = "ClientIP"

#     port {
#       port        = 80
#       target_port = 80
#     }

#     type = "LoadBalancer"
#   }

#   depends_on = [kubernetes_pod.apache-dev]
# }

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
    # {
    #   name = "service1"
    #   type = "A"
    #   ttl  = 300
    #   rrdatas = [
    #     google_container_cluster.primary.endpoint,
    #   ]
    # },
  ]
}

# Create static IP addresses per each service in the cluster
# resource "google_compute_address" "ip_address" {
#   count = 1
#   name  = "my-ip-${count.index}"
#   region = var.region
# }

# # Assign static IP addresses to services
# resource "google_compute_global_address" "global_ip_address" {
#   count = 1
#   name  = "my-global-ip-${count.index}"
#   address = google_compute_address.ip_address[count.index].address
# }
