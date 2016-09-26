# Prerequisites
1. Docker
2. Docker Compose

#Running this POC
1. Build the Docker images by issuing

```bash
   docker-compose build
```

2. Run the Docker containers by issuing:

```bash
   docker-compose up
```

#Accessing the Grafana file system

1. You can access the Grafana containers shell by issuing the following command:

```bash
   docker exec -it grafana /bin/bash
```

#Restarting the Grafana container

It may sometimes be neccessary to restart the Grafana container to install plugins.

1. Issue the following command to restart the Grafana container

```bash
   docker restart grafana
```

