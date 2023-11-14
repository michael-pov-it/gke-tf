resource "local_file" "kubeconfig" {
  content  = module.k8s_auth.kubeconfig_raw
  filename = "kubeconfig-${var.env_name}"
}
