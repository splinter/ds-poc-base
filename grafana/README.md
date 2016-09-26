#Prerequisites
1. Docker URL: https://docs.docker.com/engine/installation/

#Installation
1. Download a copy of Grafana (v3.1.1) from http://grafana.org/download/
2. Build the docker image by issuing:
```bash
   docker build -t grafana:v1 .
```
3. Run the image by issuing:
```bash
   docker run -it grafana:v1 /bin/bash
```

#Known Issues
Due to https://github.com/grafana/grafana/issues/2816 the exported dashboard json needs to be wrapped within a { "dashboard":<exported content> }
