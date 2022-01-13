# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "hashicat"
routes = [
  {
    match {
      http {
        path_prefix = "/"
      }
    }

    destination {
      service = "hashicat-web"
    }
  }
]

---

# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

consul config write -ca-file /home/minikube/ca.pem - <<EOF
kind = "service-router"
name = "hashicat"
routes = [
  {
    match {
      http {
        path_prefix = "/"
      }
    }

    destination {
      service = "hashicat-web"
    }
  }
]
EOF
