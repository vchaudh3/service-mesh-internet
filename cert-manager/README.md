helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx


helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true


kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.2.0 --set installCRDs=true

