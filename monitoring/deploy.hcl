metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Cio/UmjGe/9glMIJH6zB81T9FZ3TjZOQcA5rmlMrwJ0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Cio/UmjGe/9glMIJH6zB81T9FZ3TjZOQcA5rmlMrwJ0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:Cio/UmjGe/9glMIJH6zB81T9FZ3TjZOQcA5rmlMrwJ0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5d3de577ad7a155a583d1dbb1a03ae44c817abf627d10310faef1acad179a7ca"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:QJzNafRcIWRU2+sMuD3q9AEYu0g850LEi1jTrT1fjAM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:PhHuLPa05BoQJZ0AgS/p6FPklFSrsnc0GHd80tqBQvY="
  retries = 2
  verbose = false
}
