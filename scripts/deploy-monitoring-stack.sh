# This script deploys all application resources

#!/bin/bash

# Colors for styling sections
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

divider() {
	echo -e "${BLUE}--------------------------------------------------${NC}"
}

section() {
	divider
	echo -e "${GREEN}$1${NC}"
	echo
}

section ">> Preparing Minikube storage..."
minikube ssh -- "sudo mkdir -p /data/prometheus && sudo chmod -R 777 /data/prometheus"

section ">> Cleaning up old resources (in case of redeployment)..."
find . -name "*.yaml" -exec kubectl delete -f {} --ignore-not-found=true --wait=false \;

echo
echo -e "${YELLOW}Ensuring Grafana pod is terminated before redeployment...${NC}"
echo
kubectl delete pod -l app=grafana --ignore-not-found=true --grace-period=0 --force
sleep 3

section ">> Deploying monitoring stack in logical order..."

# 1. Persistent Volumes
kubectl apply -f prometheus/prometheus-pv.yaml
kubectl apply -f grafana/grafana-pv.yaml

# 2. Persistent Volume Claims
kubectl apply -f prometheus/prometheus-pvc.yaml
kubectl apply -f grafana/grafana-pvc.yaml

# 3. ConfigMaps y Secret
kubectl apply -f prometheus/prometheus-configmap.yaml
kubectl apply -f grafana/grafana-configmap.yaml
kubectl apply -f grafana/grafana-secret.yaml

# 4. Deployments
kubectl apply -f node-exporter/node-exporter-deploy.yaml
kubectl apply -f prometheus/prometheus-deploy.yaml
kubectl apply -f grafana/grafana-deploy.yaml

# 5. Services
kubectl apply -f node-exporter/node-exporter-service.yaml
kubectl apply -f prometheus/prometheus-service.yaml
kubectl apply -f grafana/grafana-service.yaml

section ">> Monitoring stack deployed successfully!"
