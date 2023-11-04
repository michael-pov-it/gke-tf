# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

terraform {
  
  required_version = ">= 1.5"
  
  # backend "gcs" {
  #   bucket = "gke-terraform-tfstate-bucket-2023" # GCS bucket name to store terraform tfstate
  #   prefix = "gke-test" 				                 # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  # }
  # backend "local" {
  #   path = "terraform.tfstate"
  # }
  cloud {
    organization = "mike-devops-org"

    workspaces {
      name = "workspaces_name_1"
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
  }
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

provider "google" {
  project = var.project_id
  region  = var.region
}
