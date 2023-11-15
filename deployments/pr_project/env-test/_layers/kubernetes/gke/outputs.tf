output "cluster_id" {
  description = "Cluster ID"
  value       = module.kubernetes.cluster_id
}
output "cluster_name" {
  description = "Cluster name"
  value       = module.kubernetes.name
}

output "cluster_type" {
  description = "Cluster type (regional / zonal)"
  value       = module.kubernetes.type
}

output "cluster_location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = module.kubernetes.location
}

output "cluster_region" {
  description = "Cluster region"
  value       = module.kubernetes.region
}

output "cluster_zones" {
  description = "List of zones in which the cluster resides"
  value       = module.kubernetes.zones
}

output "cluster_endpoint" {
  sensitive   = true
  description = "Cluster endpoint"
  value       = module.kubernetes.endpoint
}

# output "min_master_version" {
#   description = "Minimum master kubernetes version"
#   value       = module.kubernetes.min_master_version
# }

# output "logging_service" {
#   description = "Logging service used"
#   value       = module.kubernetes.logging_service
# }

# output "monitoring_service" {
#   description = "Monitoring service used"
#   value       = module.kubernetes.monitoring_service
# }

# output "master_authorized_networks_config" {
#   description = "Networks from which access to master is permitted"
#   value       = module.kubernetes.master_authorized_networks_config
# }

# output "master_version" {
#   description = "Current master kubernetes version"
#   value       = module.kubernetes.master_version
# }

# output "ca_certificate" {
#   sensitive   = true
#   description = "Cluster ca certificate (base64 encoded)"
#   value       = module.kubernetes.ca_certificate
# }

# output "network_policy_enabled" {
#   description = "Whether network policy enabled"
#   value       = module.kubernetes.network_policy_enabled
# }

# output "http_load_balancing_enabled" {
#   description = "Whether http load balancing enabled"
#   value       = module.kubernetes.http_load_balancing_enabled
# }

# output "horizontal_pod_autoscaling_enabled" {
#   description = "Whether horizontal pod autoscaling enabled"
#   value       = module.kubernetes.horizontal_pod_autoscaling_enabled
# }

# output "node_pools_names" {
#   description = "List of node pools names"
#   value       = module.kubernetes.node_pools_names
# }

# output "node_pools_versions" {
#   description = "Node pool versions by node pool name"
#   value       = module.kubernetes.node_pools_versions
# }

# output "service_account" {
#   description = "The service account to default running nodes as if not overridden in `node_pools`."
#   value       = module.kubernetes.service_account
# }

output "location" {
  value       = module.kubernetes.location
}
