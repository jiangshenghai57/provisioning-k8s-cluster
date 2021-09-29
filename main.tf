terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      version = "~> 1.3.2"
    }

    null = {
      version = "~> 2.1"
    }

    external = {
      version = "~> 1.2"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-my-cluster"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "kind-my-cluster"
  }
}

module "kubernetes_dashboard" {
  source  = "cookielab/dashboard/kubernetes"
  version = "0.9.0"

  kubernetes_namespace_create = true
  kubernetes_dashboard_csrf   = "bouncy_bunnies"
}
