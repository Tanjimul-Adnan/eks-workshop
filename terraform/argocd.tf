resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.11.3"
  namespace        = "ingress-nginx"
  create_namespace = true
  wait             = true

  depends_on = [
    module.eks,
    module.vpc
  ]
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.7.12"
  namespace        = "argocd"
  create_namespace = true
  wait             = true

  values = [
    yamlencode({
      global = {
        domain = var.argocd_hostname
      }
      configs = {
        params = {
          "server.insecure" = true
        }
      }
      server = {
        ingress = {
          enabled          = true
          ingressClassName = "nginx"
          hostname         = var.argocd_hostname
          annotations = {
            "nginx.ingress.kubernetes.io/backend-protocol" = "HTTP"
          }
        }
      }
    })
  ]

  depends_on = [
    helm_release.ingress_nginx
  ]
}

resource "kubernetes_manifest" "retail_store_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "retail-store-app"
      namespace = "argocd"
      finalizers = [
        "resources-finalizer.argocd.argoproj.io"
      ]
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/aws-containers/retail-store-sample-app.git"
        targetRevision = "HEAD"
        path           = "deployment/kubernetes"
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "retail-store"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "CreateNamespace=true"
        ]
      }
    }
  }

  depends_on = [
    helm_release.argocd
  ]
}
