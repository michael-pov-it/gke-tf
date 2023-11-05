# module "argocd_dev_root" {
#   source             = "./argocd_root"
#   cluster_name       = "mike-cluster-test"
#   git_source_path    = "test/applications"
#   git_source_repoURL = "git@github.com:michael-pov-it/gke-tf.git"
# }

# module "argocd_dev" {
#   source           = "./argocd"
#   eks_cluster_name = "mike-cluster-test"
#   chart_version    = "5.46.7"
# }
