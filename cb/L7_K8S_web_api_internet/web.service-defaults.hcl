consul config write - <<EOF
Kind = "proxy-defaults"
Name = "global"
Config {
  protocol = "http"
  "envoy_prometheus_bind_addr" = "0.0.0.0:9102"
}
EOF



consul config write - <<EOF
Kind = "service-defaults"
Name = "web-cb"
Config {
  ConnectTimeoutMs = 5000
  Limits {
    MaxConnections         = 3
    MaxPendingRequests    = 4
    MaxConcurrentRequests = 5
  }
  PassiveHealthCheck {
    Interval     = "30s"
    MaxFailures = 10
  }
}
EOF

consul config write - <<EOF
Kind = "service-defaults"
Name = "web-cb"

UpstreamConfig = {
  ConnectTimeoutMs = 5000
  Limits {
    MaxConnections         = 3
    MaxPendingRequests    = 4
    MaxConcurrentRequests = 5
  }
  PassiveHealthCheck {
    Interval     = "30s"
    MaxFailures = 10
  }
}
EOF


consul config write - <<EOF
Kind = "service-defaults"
Name = "web-cb"

UpstreamConfig = {
  Defaults = {
    Limits = {
      MaxConnections = 512
      MaxPendingRequests = 512
      MaxConcurrentRequests = 512
    }
  }
}
EOF

Failed to decode config entry input: 1 error occurred:
        * invalid config key "UpstreamConfig"


consul config write - <<EOF
Kind = "service-defaults"
Name = "web-cb"

UpstreamConfig = {
  Defaults = {
  ConnectTimeoutMs = 5000
    Limits = {
      MaxConnections = 3
      MaxPendingRequests = 4
      MaxConcurrentRequests = 5
    }
    PassiveHealthCheck {
      Interval     = "30s"
      MaxFailures = 10
    }
  }
}
EOF



consul config write - <<EOF
Kind = "proxy-defaults"
Name = "global"
Config {
  protocol = "http"
  "envoy_prometheus_bind_addr" = "0.0.0.0:9102"
  connect_timeout_ms = 5000
  limits {
    max_connections         = 3
    max_pending_requests    = 4
    #max_pending_requests    = 9
    max_concurrent_requests = 5
    #max_concurrent_requests = 7
  }
  passive_health_check {
    interval     = "30s"
    max_failures = 10
  }
}
EOF
