# resource "kubernetes_pod" "nginx-example" {
#   metadata {
#     name = "nginx-test-pod"

#     labels = {
#       maintained_by = "terraform"
#       app           = "nginx-example"
#     }
#   }

#   spec {
#     container {
#       image = "nginx:1.25.3"
#       name  = "nginx-example"
#     }
#   }

#   depends_on = [module.gke]
# }

# resource "kubernetes_service" "nginx-example" {
#   metadata {
#     name = "nginx-test-svc"
#   }

#   spec {
#     selector = {
#       app = kubernetes_pod.nginx-example.metadata[0].labels.app
#     }

#     session_affinity = "ClientIP"

#     port {
#       port        = 8080
#       target_port = 80
#     }

#     type = "LoadBalancer"
#   }

#   depends_on = [module.gke]
# }
