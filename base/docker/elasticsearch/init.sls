elasticsearch_image:
  docker.pulled:
    - name: dockerfile/elasticsearch
    - tag: latest

elasticsearch_container:
  docker.installed:
    - name: elasticsearch
    - image: dockerfile/elasticsearch
    - ports:
        - "9200/tcp"
        - "9300/tcp"
    - volumes:
      - /srv/docker/elasticsearch:/data
    - required:
      - docker: elasticsearch_image

elasticsearch_config:
  file.managed:
    - name: /srv/docker/elasticsearch/elasticsearch.yml
    - source: salt://docker/elasticsearch/files/elasticsearch.yml
    
elasticsearch_container_run:
  docker.running:
    - container: elasticsearch
    - privileged: true
    - port_bindings:
        "9200/tcp":
          HostIp: ""
          HostPort: "9200"
        "9300/tcp":
          HostIp: ""
          HostPort: "9300"
    - binds:
        /srv/docker/elasticsearch: 
          bind: /data
          ro: false
    - required:
      - docker: elasticsearch_container
      - file: elasticsearch_config

