[Haz click aquí para la versión en Español](#versión-en-español)

# Integration of Prometheus, Grafana and Node Exporter on Kubernetes

Welcome to my monitoring project using Prometheus, Grafana and Node Exporter! This setup allows you to effortlessly monitor the health and performance of your environments. Below, you'll find an overview of the project, how to deploy it and additional resources to get you started.

## Overview

This project simplifies the monitoring of environments using Prometheus for metrics collection, Grafana for visualization and Node Exporter for host-level metrics. Whether you're new to monitoring or looking to enhance your existing setup, these configurations and setup instructions will help you get up and running quickly.

> [!NOTE]
> This project was originally deployed on Kubernetes using Minikube. If you don't have Minikube installed, you can follow the installation instructions from the [Minikube documentation](https://minikube.sigs.k8s.io/docs/start/).

## Features

- **Prometheus Integration**: Collects metrics from applications, services or nodes at regular intervals.
- **Grafana Dashboards**: Provides visual insights into system health and application performance.
- **Node Exporter**: Collects host-level metrics to monitor servers or nodes.
- **Scalable Architecture**: Easily scales to monitor multiple environments or nodes without additional complexity.

## How to Use

### Getting Started

1. **Clone the Repository**:

         git clone https://github.com/LizzyMaken/prometheus-grafana-on-kubernetes.git
   
         cd prometheus-grafana-on-kubernetes

2. **Deploy Monitoring Stack**:

         bash scripts/deploy-monitoring-stack.sh

   > This script handles the full deployment in logical order. It includes setting up PersistentVolumes, ConfigMaps,           Secrets, Deployments, and Services. Additionally, the script connects to the Minikube VM to create the                      `/data/prometheus` directory and sets the correct permissions to ensure Prometheus can write to its volume.

   > It also forcefully deletes any existing Grafana pods before redeploying to prevent issues with persistent volume locks    or misconfigurations.

3. **Expose Services with External IPs**:

         bash scripts/start-tunnel-and-show-urls.sh

   > This script runs `minikube tunnel` in the background and displays the external IPs for Prometheus and Grafana. This       command is used to create a route to services deployed with the type LoadBalancer, allowing them to be accessed             externally. It exposes the external IP directly to programs running on the host operating system, enabling easier access    to those services.

### Accessing Prometheus and Grafana

- Use the printed URLs from the script output to access Grafana and Prometheus in your browser.
- Default URL will look like `http://<EXTERNAL_IP>:3000` and `http://<EXTERNAL_IP>:9090` (external IPs are also               accessible using the command `kubectl get svc grafana` after creating the tunnel).
- Login credentials for grafana are found in `grafana/grafana-secret.yaml`.

### Exploring Dashboards

- Grafana comes preconfigured with dashboards for system metrics.
- Customize and create new dashboards to monitor specific applications or environments.

### Undeploying the Stack

To clean uo all the monitoring resources:

         bash scripts/undeploy-monitoring-stack.sh

> If the undeployment hangs after deleting the `grafana-data-claim`, it's a known issue related to finalizers. The undeploy script includes logic to automatically force the deletion to avoid this issue.

## Additional Resources

Explore more about Prometheus, Grafana and monitoring practices:

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)

## Contributing

I'm open to contributions! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

Happy monitoring!

---

## Versión en Español

[Click here for English Version](#integration-of-prometheus-grafana-and-node-exporter-on-kubernetes)

# Integración de Prometheus, Grafana y Node Exporter en Kubernetes

¡Bienvenido a mi proyecto de monitorización utilizando Prometheus, Grafana y Node Exporter! Esta configuración te permitirá supervisar de manera eficiente la salud y el rendimiento de tus entornos. A continuación, encontrarás una visión general del proyecto, cómo desplegarlo y recursos adicionales para comenzar.

## Descripción General

Este proyecto simplifica la monitorización de entornos utilizando Prometheus para la recolección de métricas, Grafana para la visualización y Node Exporter para métricas a nivel de host. Ya sea que estés comenzando con la monitorización o busques mejorar tu configuración actual, estas instrucciones te ayudarán a empezar rápidamente.

> [!NOTE]
> Este proyecto fue originalmente desplegado en Kubernetes utilizando Minikube. Si no lo tienes instalado, puedes seguir las instrucciones de instalación en la [documentación de Minikube](https://minikube.sigs.k8s.io/docs/start/es/).

## Características

- **Integración con Prometheus**: Recolecta métricas de aplicaciones, servicios o nodos a intervalos regulares.
- **Paneles de Grafana**: Proporciona insights visuales sobre la salud del sistema y el rendimiento de las aplicaciones.
- **Node Exporter**: Recolecta métricas a nivel de host para monitorizar servidores o nodos.
- **Arquitectura Escalable**: Escala fácilmente para monitorizar múltiples entornos o nodos sin complejidad adicional.

## Uso

### Para empezar

1. **Clona el Repositorio**:

       git clone https://github.com/LizzyMaken/prometheus-grafana-on-kubernetes.git
       cd prometheus-grafana-on-kubernetes

2. **Despliega el stack de monitorización**:

       bash scripts/deploy-monitoring-stack.sh

   > Este script automatiza todo el despliegue en orden lógico: volúmenes persistentes, ConfigMaps, Secrets, Deployments y     Services. Además, se conecta automáticamente a la VM de Minikube para crear el directorio `/data/prometheus` y ajustar      los permisos, garantizando que Prometheus pueda escribir en su volumen.
   
   > También elimina forzadamente cualquier pod de Grafana existente antes de volver a desplegar, evitando errores de          bloqueo del volumen persistente o configuraciones corruptas.

3. **Exponer servicios con IP externa**:

       bash scripts/start-tunnel-and-show-urls.sh

   > Este script ejecuta `minikube tunnel` en segundo plano y muestra las IPs externas de Prometheus y Grafana. Este           comando se utiliza para crear una ruta hacia los servicios desplegados con el tipo LoadBalancer, lo que permite acceder     a ellos externamente. Expone la IP externa directamente a los programas que se ejecutan en el sistema operativo host,       facilitando el acceso a esos servicios.

### Accede a Prometheus y Grafana

- Utilia las URLs impresas por el script para acceder a Prometheus y Grafana desde el navegador.
- Las URLs por defecto serán `http://<IP_EXTERNA>:3000` y `http://<IP_EXTERNA>:9090` (las IPs externas también son            accesibles usando el comando `kubectl get svc grafana` después de crear el túnel).
- Las credenciales para Grafana están en `grafana/grafana-secret.yaml`.

### Explora los Paneles de Control

- Grafana viene preconfigurado con paneles de control para métricas del sistema.
- Personaliza y crea nuevos paneles para monitorear aplicaciones específicas o entornos.

### Eliminar el stack

Para eliminar todos los recursos del entorno de monitorización:

         bash scripts/undeploy-monitoring-stack.sh

> Si el proceso se queda colgado después de eliminar `grafana-data-claim`, es un problema conocido relacionado con los finalizadores. El script incluye una instrucción para forzar su eliminación automáticamente y evitar bloqueos.

## Recursos Adicionales

Explora más sobre Prometheus, Grafana y prácticas de monitorización:

- [Documentación de Prometheus](https://prometheus.io/docs/)
- [Documentación de Grafana](https://grafana.com/docs/)

## Contribuciones

¡Estoy abierta a contribuciones! Si encuentras algún problema o tienes sugerencias para mejoras, por favor abre un issue o envía un pull request.

¡Buena monitorización!
