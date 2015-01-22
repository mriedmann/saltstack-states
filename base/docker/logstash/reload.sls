logstash_container_remove:
  docker.absent:
    - name: logstash

include:
  - docker.logstash
