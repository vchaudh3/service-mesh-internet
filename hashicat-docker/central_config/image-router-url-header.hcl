# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "hashicat-image"
routes = [
  {
    match {
      http {
        header = [
          {
            name  = "Hashicat-canary"
            Exact = "True"
          }
        ],
        path_prefix = "/url"
      }
    }

    destination {
      service = "hashicat-url"
    }
  }
]

---

# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.
consul config write -ca-file /home/minikube/ca.pem - <<EOF
kind = "service-router"
name = "hashicat-image"
routes = [
  {
    match {
      http {
        header = [
          {
            name  = "Hashicat-canary"
            Exact = "True"
          }
        ],
        path_prefix = "/url"
      }
    }

    destination {
      service = "hashicat-url"
    }
  }
]
EOF
