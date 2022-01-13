kind = "service-splitter",
name = "hashicat-metadata"

splits = [
  {
    weight = 50,
    service_subset = "v1"
  },
  {
    weight = 50,
    service_subset = "v2"
  }
]

---

consul config write -ca-file /home/minikube/ca.pem - <<EOF
kind = "service-splitter",
name = "hashicat-metadata"

splits = [
  {
    weight = 50,
    service_subset = "v1"
  },
  {
    weight = 50,
    service_subset = "v2"
  }
]
EOF

