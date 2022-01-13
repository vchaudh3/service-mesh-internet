consul config write - <<EOF
Kind = "terminating-gateway"
Name = "terminating-gateway-dc1"
Services = [
 {
   Name = "nginx"
 }
]
EOF

#consul config write terminating-gateway.hcl
#export consul http addr first

consul config write - <<EOF
Kind = "terminating-gateway"
Name = "terminating-gateway-dc1"
Services = [
 {
   Name = "nginx"
 },
 {
   Name = "nginx-local-host"
 },
 {
   Name = "consul-https"
   caFile = "/etc/ssl/cert.pem"
 },
 {
   Name = "httpbin"
 },
 {
   Name = "nginx-local-host-ext"
 },
 {
   Name = "mysql-ext"
 },
 {
   Name = "httpbin-ip"
 },
 {
   Name = "httpbin-ip-name"
 },
 {
   Name = "nginx-local-host-name"
 },
 {
   Name = "nginx-pub-host-alias"
 },
 {
   Name = "tetarwal-de"
 },
 {
   Name = "learn"
 },
 {
   Name = "tetarwal-de-mysql"
 },
]
EOF


consul config write - <<EOF
Kind = "terminating-gateway"
Name = "terminating-gateway-dc1"
Services = [
 {
   Name = "httpbin"
 },
 {
   Name = "learn"
 },
 {
   Name = "tetarwal-de-mysql"
 },
]
EOF
