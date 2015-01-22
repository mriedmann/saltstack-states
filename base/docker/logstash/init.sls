logstash_container:
  docker.installed:
    - name: logstash
    - image: pblittle/docker-logstash
    - ports:
        - "9200/tcp"
        - "9292/tcp"
        - "5000/tcp"
    - environment:
        LOGSTASH_CONFIG_URL: https://gist.githubusercontent.com/mriedmann/8e4031c0f02c27e566ed/raw/r3i-logstash.conf
        LF_SSL_CERT_KEY_URL: https://gist.githubusercontent.com/mriedmann/1b1eeb51c0589781dcdf/raw/r3i-logstash-forwarder.key
        LF_SSL_CERT_URL: https://gist.githubusercontent.com/mriedmann/636b11777105801516e9/raw/r3i-logstash-forwarder.crt

logstash_container_run:
  docker.running:
    - container: logstash
    - port_bindings:
        "9292/tcp":
          HostIp: ""
          HostPort: "9292"
        "5000/tcp":
          HostIp: ""
          HostPort: "5000"
    - links:
        elasticsearch: es
    - required:
      - docker: logstash_container
