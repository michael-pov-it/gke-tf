# resource "kubernetes_namespace" "argocd" {
#   metadata {
#     name = "argocd"
#   }
#   depends_on = [ module.kubernetes ]
# }