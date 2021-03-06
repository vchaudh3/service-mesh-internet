# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "hashicat-image"
routes = [
  {
    match {
      http {
        path_prefix = "/url"
      }
    }

    destination {
      service = "hashicat-url"
    }
  },
    {
    match {
      http {
        path_prefix = "/metadata"
      }
    }

    destination {
      service = "hashicat-metadata"
    }
  },
]

---

consul config write -ca-file /home/minikube/ca.pem - <<EOF
kind = "service-router"
name = "hashicat-image"
routes = [
  {
    match {
      http {
        path_prefix = "/url"
      }
    }

    destination {
      service = "hashicat-url"
    }
  },
    {
    match {
      http {
        path_prefix = "/metadata"
      }
    }

    destination {
      service = "hashicat-metadata"
    }
  },
]
EOF
