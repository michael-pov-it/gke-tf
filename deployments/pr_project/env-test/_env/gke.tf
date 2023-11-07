module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  version                    = "28.0.0"
  project_id                 = var.project_id
  name                       = "${var.cluster_name}-${var.env_name}"
  regional                   = true
  region                     = var.region
  zones                      = var.zones
  network                    = module.gcp-network.network_name
  subnetwork                 = module.gcp-network.subnets_names[0]
  ip_range_pods              = var.ip_range_pods_name
  ip_range_services          = var.ip_range_services_name
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = false // true
  filestore_csi_driver       = false
  create_service_account     = true
  logging_service            = "logging.googleapis.com/kubernetes"

  node_pools = [
    {
      name                = "node-pool-test"
      machine_type        = "e2-standard-2"
      node_locations      = "europe-west3-b,europe-west3-c"
      min_count           = 1
      max_count           = 3
      disk_size_gb        = 30
      spot                = false
      auto_upgrade        = true
      auto_repair         = true
      autoscaling         = false
      preemptible         = false
      initial_node_count  = 80
      service_account     = "789559055596-compute@developer.gserviceaccount.com"
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    node-pool-test = {
      shutdown-script                 = "kubectl --kubeconfig=/var/lib/kubelet/kubeconfig drain --force=true --ignore-daemonsets=true --delete-local-data \"$HOSTNAME\""
      node-pool-metadata-custom-value = "node-pool-test"
    }
  }

  node_pools_taints = {
    all = []

    node-pool-test = [
      {
        key    = "node-pool-test"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []
    node-pool-test = [
      "node-test-pool",
      "owner:mike-gordievsky",
    ]
  }
  
  depends_on = [
    module.gcp-network
  ]
}
