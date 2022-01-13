kubectl -n qconsul4 get secret consul-ca-cert -o jsonpath="{.data['tls\.crt']}" | base64 --decode > ca.pem
export CONSUL_HTTP_TOKEN=$(kubectl -n qconsul4 get secrets/consul-bootstrap-acl-token --template={{.data.token}} | base64 -d)
export CONSUL_HTTP_ADDR=https://127.0.0.1:8501
export CONSUL_HTTP_ADDR=https://127.0.0.1:8500

kubectl -n qconsul4 port-forward consul-server-0 8501:8501
consul members -ca-file ca.pem

#curl --request PUT --data @nginx.json localhost:8500/v1/catalog/register
#curl --request PUT --data @nginx-local-host.json localhost:8500/v1/catalog/register

curl https://localhost:8500/v1/catalog/service/k8s-demo-sm -k
curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" --data @nginx.json -k $CONSUL_HTTP_ADDR/v1/catalog/register
curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" --data @nginx-local-host.json -k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/consul-https.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/httpbin.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/nginx-local-host-ext.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/mysql-ext.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/httpbin-ip.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/httpbin-ip-name.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/nginx-local-host-name.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/nginx-local-host-alias.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/nginx-pub-host-alias.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/tetarwal.de.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/hc.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/tetarwal.de-mysql.json \
-k $CONSUL_HTTP_ADDR/v1/catalog/register

curl --request PUT --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
--data @/efs/git/sm-demo-apr-2021/Kube-nodejs-mysql/mysql.json \
-k $CONSUL_HTTP_ADDR/v1/agent/service/register
