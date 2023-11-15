terraform {

  required_version = "~> 1.6.0"

  cloud {
    organization = "mike-devops-org"

    workspaces {
      name = "mike-dev"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# provider "kubernetes" {
#   host                   = "https://35.246.204.21" //"https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }
