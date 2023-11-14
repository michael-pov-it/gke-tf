output "network_name" {
  description = "Cluster endpoint"
  value       = module.main-network.network_name
}

output "subnets_names" {
  description = "Cluster endpoint"
  value       = module.main-network.subnets_names
}
