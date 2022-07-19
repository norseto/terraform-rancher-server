terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.24.0"
    }
    rke = {
      source = "rancher/rke"
      version = "1.3.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}
