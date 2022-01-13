consul config write - <<EOF
Kind = "proxy-defaults"
Name = "global"
Config {
  protocol = "http"
  "envoy_prometheus_bind_addr" = "0.0.0.0:9102"
}
EOF


consul config write - <<EOF
Kind = "proxy-defaults"
Name = "global"
MeshGateway {
   Mode = "local"
}
Config {
  protocol = "http"
  "envoy_prometheus_bind_addr" = "0.0.0.0:9102"
}
EOF


consul config write - <<EOF
Kind = "ingress-gateway"
Name = "ingress-gateway-1"

Listeners = [
  {
    Port     = 8080
    Protocol = "http"
        Services = [
      {
        Name  = "hello-app-sm-enabled"
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
name = "hello-app-sm-enabled"
routes = [
  {
    destination {
      service = "world-app-sm-enabled"
      RetryOnConnectFailure = true
      #RequestTimeout = "120s"
      #RequestTimeout = "2s"
      #RequestTimeout = "5s"
      #RequestTimeout = "12s"
      #RequestTimeout = "9s"
    }
  }
]
EOF

consul config write - <<EOF
# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "world-app-sm-enabled"
routes = [
  {
    destination {
      service = ""
      RetryOnConnectFailure = true
      RequestTimeout = "120s"
      #RequestTimeout = "2s"
      #RequestTimeout = "5s"
      #RequestTimeout = "12s"
      #RequestTimeout = "9s"
    }
  }
]
EOF

consul config write - <<EOF
# NOTE: Routes are evaluated in order. The first route to match will stop
# processing.

kind = "service-router"
name = "world-app-sm-enabled-2"
routes = [
  {
    destination {
      service = ""
      RetryOnConnectFailure = true
      #RequestTimeout = "120s"
      RequestTimeout = "2s"
      #RequestTimeout = "5s"
      #RequestTimeout = "12s"
      #RequestTimeout = "9s"
    }
  }
]
EOF




consul config write - <<EOF
kind = "service-resolver"
name = "world-app-sm-enabled"

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
name = "world-app-sm-enabled-2"

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
name = "world-app-sm-enabled"

splits = [
  {
    weight = 100,
    #weight = 0,
    service_subset = "v1"
  },
  {
    #weight = 0,
    #weight = 100,
    service_subset = "v2"
  }
]
EOF


consul config write - <<EOF
kind = "service-splitter",
name = "world-app-sm-enabled-2"

splits = [
  {
    weight = 100,
    ##weight = 0,
    #weight = 34,
    service_subset = "v1"
  },
  {
    weight = 0,
    #weight = 100,
    #weight = 33,
    service_subset = "v2"
  },
  {
    #weight = 0,
    #weight = 100,
    #weight = 33,
    service_subset = "v3"
  }
]
EOF

