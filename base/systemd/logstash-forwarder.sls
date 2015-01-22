systemd_logstash-forwarder_file:
  file.managed:
    - name: /etc/systemd/system/logstash-forwarder.service
    - source: salt://systemd/files/logstash-forwarder.service
    - user: root
    - group: root
    - mode: 744

