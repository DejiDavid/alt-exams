resource "kubernetes_ingress_v1" "voting-ingress" {
  metadata {
    name      = "azure-vote-front"
   # namespace = "voting-app"
    labels = {
      name = "azure-vote-front"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "voting.dejidavid.me"
      http {
        path {
          backend {
            service{
              name = "azure-vote-front"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = "sock-shop"
    namespace = "sock-shop"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "sock-shop.dejidavid.me"
      http {
        path {
          backend {
            service{
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}