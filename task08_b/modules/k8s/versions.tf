terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.1"
    }
  }
}