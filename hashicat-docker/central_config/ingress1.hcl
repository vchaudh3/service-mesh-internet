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
  }
]


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
  }
]
EOF

