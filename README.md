[Haga click aquí para la versión en Español](#versión-en-español)

# Integration of Prometheus and Grafana

Welcome to my monitoring project using Prometheus and Grafana! This setup allows you to effortlessly monitor the health and performance of your environments. Below, you'll find an overview of the project, how to deploy it, and additional resources to get you started.

## Overview

This project simplifies the monitoring of environments using Prometheus for metrics collection and Grafana for visualization. Whether you're new to monitoring or looking to enhance your existing setup, these configurations and setup instructions will help you get up and running quickly.

The setup includes Node Exporter for collecting host-level metrics from servers or nodes.

## Features

- **Prometheus Integration**: Collects metrics from applications, services, or nodes at regular intervals.
- **Grafana Dashboards**: Provides visual insights into system health and application performance.
- **Node Exporter**: Collects host-level metrics to monitor servers or nodes.
- **Scalable Architecture**: Easily scales to monitor multiple environments or nodes without additional complexity.

## How to Use

### Getting Started

1. **Clone the Repository**:
   
       git clone https://github.com/your/repository.git
       cd repository

2. **Deploy Prometheus**:
   
       kubectl apply -f prometheus/

3. **Deploy Grafana**:
   
       kubectl apply -f grafana/

### Accessing Grafana

- Retrieve the external IP using `kubectl get svc grafana`.
- Access Grafana at `http://<EXTERNAL_IP>:3000`.
- Log in with credentials found in `grafana-secret.yaml`.

### Exploring Dashboards

- Grafana comes preconfigured with dashboards for system metrics.
- Customize and create new dashboards to monitor specific applications or environments.

## Additional Resources

Explore more about Prometheus, Grafana and monitoring practices:

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)

## Contributing

I'm open to contributions! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

Enjoy!

---

## Versión en Español / Spanish Version

[Click here for English Version](#integration-of-prometheus-and-grafana)

# Integración de Prometheus y Grafana

¡Bienvenido a mi proyecto de monitorización utilizando Prometheus y Grafana! Esta configuración te permitirá supervisar de manera eficiente la salud y el rendimiento de tus entornos. A continuación, encontrarás una visión general del proyecto, cómo desplegarlo y recursos adicionales para comenzar.

## Visión General

Este proyecto simplifica la monitorización de entornos utilizando Prometheus para la recolección de métricas y Grafana para la visualización. Ya sea que estés comenzando con la monitorización o busques mejorar tu configuración actual, estas instrucciones te ayudarán a empezar rápidamente.

La configuración incluye Node Exporter para la recolección de métricas a nivel de host desde servidores o nodos.

## Características

- **Integración con Prometheus**: Recolecta métricas de aplicaciones, servicios o nodos a intervalos regulares.
- **Paneles de Grafana**: Proporciona insights visuales sobre la salud del sistema y el rendimiento de las aplicaciones.
- **Node Exporter**: Recolecta métricas a nivel de host para monitorizar servidores o nodos.
- **Arquitectura Escalable**: Escala fácilmente para monitorizar múltiples entornos o nodos sin complejidad adicional.

## Uso

### Para empezar

1. **Clona el Repositorio**:
   
       git clone https://github.com/your/repository.git
       cd repository

2. **Despliega Prometheus**:
   
       kubectl apply -f prometheus/

3. **Despliega Grafana**:
   
       kubectl apply -f grafana/

### Accede a Grafana

- Obtén la IP externa usando `kubectl get svc grafana`.
- Accede a Grafana en `http://<IP_EXTERNA>:3000`.
- Inicia sesión con las credenciales encontradas en `grafana-secret.yaml`.

### Explora los Paneles de Control

- Grafana viene preconfigurado con paneles de control para métricas del sistema.
- Personaliza y crea nuevos paneles para monitorear aplicaciones específicas o entornos.

## Recursos Adicionales

Explora más sobre Prometheus, Grafana y prácticas de monitorización:

- [Documentación de Prometheus](https://prometheus.io/docs/)
- [Documentación de Grafana](https://grafana.com/docs/)

## Contribuciones

¡Estoy abierta a contribuciones! Si encuentras algún problema o tienes sugerencias para mejoras, por favor abre un issue o envía un pull request.

Happy hacking!
