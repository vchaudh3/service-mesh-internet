
consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway"

Listeners = [
  {
    Port     = 8080
    #Port     = 9091
    Protocol = "http"
        Services = [
      {
        Name  = "web"
        Hosts = "*"
      }
    ]
  }
]
EOF


consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway"

Listeners = [
  {
    Port     = 8080
    #Port     = 9091
    Protocol = "http"
        Services = [
      {
        Name  = "web"
        Hosts = "*"
      }
    ]
  },
  {
    Port     = 8443
    #Port     = 9091
    Protocol = "http"
        Services = [
      {
        Name  = "web"
        Hosts = "*"
      }
    ]
  }
]
EOF



consul config write - <<EOF
# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "web"
routes = [
  {
    match {
      http {
        path_prefix = "/"
      }
    }

    destination {
      service = "api"
    }
  }
]
EOF

consul config write - <<EOF
# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "web"
routes = [
  {
    destination {
      service = ""
    }
  }
]
EOF

consul config write - <<EOF
# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "api-cb"
routes = [
  {
    destination {
      service = ""
    }
  }
]
EOF



consul config write - <<EOF
kind = "service-resolver"
name = "api"

# https://www.consul.io/api/health.html#filtering-2
# Show Node.Meta demonstration showing performance testing a new instance type
default_subset = "v1"

subsets = {
  v1 = {
    filter = "Service.Meta.version == 1"
  }
  v2 = {
    filter = "Service.Meta.version == 2"
  }
}
EOF

consul config write - <<EOF
kind = "service-resolver"
name = "api-cb"

# https://www.consul.io/api/health.html#filtering-2
# Show Node.Meta demonstration showing performance testing a new instance type
default_subset = "v1"

subsets = {
  v1 = {
    filter = "Service.Meta.version == 1"
  }
  v2 = {
    filter = "Service.Meta.version == 2"
  }
  v3 = {
    filter = "Service.Meta.version == 3"
  }
}
EOF




consul config write - <<EOF
kind = "service-splitter",
name = "api"

splits = [
  {
    #weight = 100,
    weight = 50,
    #weight = 0,
    service_subset = "v1"
  },
  {
    #weight = 0,
    weight = 50,
    #weight = 100,
    service_subset = "v2"
  }
]
EOF


consul config write - <<EOF
kind = "service-splitter",
name = "api-cb"

splits = [
  {
    #weight = 100,
    #weight = 50,
    weight = 40,
    #weight = 0,
    service_subset = "v1"
  },
  {
    #weight = 0,
    #weight = 50,
    weight = 20,
    #weight = 100,
    service_subset = "v2"
  },
  {
    #weight = 0,
    #weight = 50,
    weight = 40,
    #weight = 100,
    service_subset = "v3"
  }
]
EOF

consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-2"

Listeners = [
  {
    Port     = 8080
    #Port     = 9091
    Protocol = "http"
        Services = [
      {
        Name  = "web-cb"
        Hosts = "*"
      }
    ]
  }
]
EOF



consul config write - <<EOF
Kind = "service-intentions"
Name = "api-cb"
Sources = [
  {
    Name   = "demo-downstream to api-cb"
    Action = "allow"
  }
]
EOF

