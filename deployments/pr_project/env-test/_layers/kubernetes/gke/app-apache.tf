resource "kubernetes_pod" "apache-dev" {
  metadata {
    name = "apache-dev-pod"

    labels = {
      maintained_by = "terraform"
      app           = "apache-example"
    }
  }

  spec {
    container {
      image = "ubuntu/apache2:latest"
      name  = "apache-example"
    }
  }

  depends_on = [module.kubernetes]
}

resource "kubernetes_service" "apache-dev" {
  metadata {
    name = "apache-dev-svc"
  }

  spec {
    selector = {
      app = kubernetes_pod.apache-dev.metadata[0].labels.app
    }

    session_affinity = "ClientIP"

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }

  depends_on = [module.kubernetes]
}
