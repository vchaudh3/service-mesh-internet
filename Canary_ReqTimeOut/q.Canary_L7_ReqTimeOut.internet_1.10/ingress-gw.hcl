consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "k8s-demo"
        Hosts = "k8s-demo.domain"
      }
    ],
        Services = [
      {
        Name  = "ingress-multitier-app"
        Hosts = "ingress-multitier-app.domain"
      }
    ],
        Services = [
      {
        Name  = "httpbin"
        Hosts = "httpbin.domain"
      }
    ]
  },
  {
    Port     = 8443
    Protocol = "http"
        Services = [
      {
        Name  = "hello-kubernetes"
        Hosts = ["hello-kubernetes.domain", "hello-kubernetes.domain:8443"]
      }
    ],
        Services = [
      {
        Name  = "hello-app"
        Hosts = ["hello-app.domain", "hello-app.domain:8443"]
      }
    ],
        Services = [
      {
        Name  = "hello-app-sm-enabled"
        Hosts = ["hello-app-sm-enabled.domain", "hello-app-sm-enabled.domain:8443"]
      }
    ],
        Services = [
      {
        Name  = "web-cb"
        Hosts = ["web-cb.domain", "web-cb.domain:8443"]
      }
    ]
}
]
EOF
---

