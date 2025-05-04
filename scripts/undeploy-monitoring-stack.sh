# This scripts removes all deployed resources

#!/bin/bash

# Colors for styling sections
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

divider() {
	echo -e "${BLUE}--------------------------------------------------${NC}"
}

section1() {
	divider
	echo -e "${GREEN}$1${NC}"
	echo
}

section2() {
	echo -e "${YELLOW}$1${NC}"
	echo
}

section1 ">> Deleting monitoring stack resources..."

find ../. -name "*.yaml" -exec kubectl delete -f {} --ignore-not-found=true --wait=false \;

section2 "Ensuring Grafana pod is terminated..."
kubectl delete pod -l app=grafana --ignore-not-found=true --grace-period=0 --force
sleep 3

echo
section2 "Force deleting Grafana PVC..."
kubectl delete pvc grafana-data-claim --ignore-not-found=true --grace-period=0 --force

section1 ">> All resources have been removed."
