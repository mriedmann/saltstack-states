pki_logstash_cert:
  file.managed:
    - name: /etc/pki/logstash/logstash-forwarder.crt
    - source: salt://files/pki/logstash/logstash-forwarder.crt
    - makedirs: True
    - user: root
    - group: root

pki_logsatsh_key:
  file.managed:
    - name: /etc/pki/logstash/logstash-forwarder.key
    - source: salt://files/pki/logstash/logstash-forwarder.key
    - makedirs: True
    - user: root
    - group: root

