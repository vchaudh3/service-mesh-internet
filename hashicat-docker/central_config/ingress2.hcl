Kind = "ingress-gateway"
Name = "ingress-gateway"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "hashicat"
        Hosts = "*"
      }
    ]
  },
  {
    Port     = 8180
    Protocol = "http"
        Services = [
      {
        Name  = "hashicat-web"
        Hosts = "*"
      }
    ]
  }
]

---


consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "hashicat"
        Hosts = "*"
      }
    ]
  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hashicat-web"
        Hosts = "*"
      }
    ]
  }
]
EOF
---
consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "*"
      }
    ]
  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = "*"
      }
    ]
  }
]
EOF
---















consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "*"
      }
    ],
        Services = [
      {
        Name  = "ingress-multitier-app"
        Hosts = "ingress-multitier-app.tetarwal.de"
      }
    ]

  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = "*"
      }
    ],
}
]
EOF
---















consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "k8s-demo.k8s-demo-domain"
      }
    ],
        Services = [
      {
        Name  = "ingress-multitier-app"
        Hosts = "ingress-multitier-app.tetarwal.de"
      }
    ]

  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = "*"
      }
    ],
}
]
EOF
---






consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "k8s-demo.k8s-demo-domain"
      }
    ],
        Services = [
      {
        Name  = "ingress-multitier-app"
        Hosts = "ingress-multitier-app.tetarwal.de"
      }
    ]

  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = "hello-kubernetes.hello-kubernetes-domain"
      }
    ],
}
]
EOF
---







consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "k8s-demo.k8s-demo-domain"
      }
    ],
        Services = [
      {
        Name  = "ingress-multitier-app"
        Hosts = "ingress-multitier-app.ingress-multitier-app-domain"
      }
    ]

  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = ["hello-kubernetes.hello-kubernetes-domain", "hello-kubernetes.hello-kubernetes-domain:8443"]
      }
    ],
}
]
EOF
---

