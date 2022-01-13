consul config write -ca-file /home/minikube/ca.pem - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "aks-helloworld-one"
        Hosts = "*"
      }
    ]
  }
]
EOF
---
consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-dc1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "aks-helloworld-one"
        #Name  = "aks-helloworld-two"
        Hosts = "*"
      }
    ]
  }
]
EOF
---
consul config write - <<EOF
Kind = "service-defaults"
Name = "aks-helloworld-two"
Protocol = "http"
EOF
---
consul config write - <<EOF
Kind = "service-defaults"
Name = "aks-helloworld-one"
Protocol = "http"
EOF
---
