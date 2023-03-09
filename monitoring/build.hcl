metadata {
  name = "monitoring"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/monitoring"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "3d2d3e151e9ee83761bdc8cb2bd82b79acaf52a3628c390066c9c4d414b4fe80"
    retries = 0
    verbose = false
  }
}
