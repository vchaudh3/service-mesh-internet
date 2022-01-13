consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one/static"
      }
    }

    Destination {
      Service = "/"
    }
  },
  # NOTE: a default catch-all will send unmatched traffic to "web"
]
EOF

---

consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one/static"
      }
    }

    Destination {
      Service = "/"
      #Service = "/static"
    }
  },
  # NOTE: a default catch-all will send unmatched traffic to "web"
]
EOF

---

consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one/static"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one/aks-helloworld-one/static"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/static"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
]
EOF

---

consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        PathPrefix = "/aks-helloworld-one"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/static"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
]
EOF

---
consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        #PathPrefix = "/aks-helloworld-one"
        PathRegex = "/aks-helloworld*"
        #PathRegex = "/aks-helloworld-[A-Z0-9]"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      #PrefixRewrite = "/"
    }
  },
]
EOF
---
consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        #PathPrefix = "/aks-helloworld-one"
        #PathRegex = "/aks-helloworld*"
        PathRegex = "/aks-helloworld-[A-Z0-9]"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      #PrefixRewrite = "/"
    }
  },
]
EOF
---
consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        #PathPrefix = "/aks-helloworld-one"
        #PathRegex = "/aks-helloworld*"
        PathRegex = "/hello-world-one(/|$)(.*)"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      #PrefixRewrite = "/"
    }
  },
]
EOF
---
consul config write - <<EOF
Kind = "service-router"
Name = "aks-helloworld-one"
Routes = [
  {
    Match {
      HTTP {
        #PathPrefix = "/aks-helloworld-one"
        Header = [
          {
            Name  = "x-debug"
            Exact = "1"
          },
        ]
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      #PrefixRewrite = "/"
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/static"
      }
    }

    Destination {
      Service = "aks-helloworld-one"
      PrefixRewrite = "/"
    }
  },
]
EOF
---
