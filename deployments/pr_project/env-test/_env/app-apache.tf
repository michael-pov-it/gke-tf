# resource "kubernetes_pod" "apache-example" {
#   metadata {
#     name = "apache-test-pod"

#     labels = {
#       maintained_by = "terraform"
#       app           = "apache-example"
#     }
#   }

#   spec {
#     container {
#       image = "httpd:latest"
#       name  = "apache-example"
#     }
#   }

#   depends_on = [module.gke]
# }

# resource "kubernetes_service" "apache-example" {
#   metadata {
#     name = "apache-test-svc"
#   }

#   spec {
#     selector = {
#       app = kubernetes_pod.apache-example.metadata[0].labels.app
#     }

#     session_affinity = "ClientIP"

#     port {
#       port        = 80
#       target_port = 80
#     }

#     type = "LoadBalancer"
#   }

#   depends_on = [module.gke]
# }
