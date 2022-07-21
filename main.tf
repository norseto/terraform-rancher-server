terraform {
  required_providers {
    aws = {
      version = ">= 4.0.0"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "~> 1.24"
    }
    rke = {
      source  = "rancher/rke"
      version = "~> 1.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
  }
}
