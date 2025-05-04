# This script creates a tunnel for Grafana and Prometheus services in Minikube and retrieves their URLs

#!/bin/bash

echo "Starting Minikube tunnel in the background..."
nohup minikube tunnel > /dev/null 2>&1 &

echo "Waiting for external IPs to be assigned..."
sleep 10

echo
echo "Services with external IPs:"
echo "----------------------------"

services=("grafana" "prometheus")

for svc in "${services[@]}"; do
	IP=$(kubectl get svc $svc -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null)
	PORT=$(kubectl get svc $svc -o jsonpath='{.spec.ports[0].port}' 2>/dev/null)

	if [[ -n "$IP" && -n "$PORT" ]]; then
		echo "$svc -> http://$IP:$PORT"
	else
		echo "$svc -> Unavailable (is it deployed as Load Balancer?)"
	fi
done

echo
echo "Tunnel is running! You can safely close this terminal; services will remain active."
