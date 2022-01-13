kind = "service-splitter",
name = "hashicat-metadata"

splits = [
  {
    weight = 100,
    service_subset = "v1"
  },
  {
    weight = 0,
    service_subset = "v2"
  }
]

---

consul config write -ca-file /home/minikube/ca.pem - <<EOF
kind = "service-splitter",
name = "hashicat-metadata"

splits = [
  {
    weight = 100,
    service_subset = "v1"
  },
  {
    weight = 0,
    service_subset = "v2"
  }
]
EOF

