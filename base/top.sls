base:
  '*':
    - defaults
    - pki
    - users
    - salt.minion
    - systemd.logstash-forwarder
    - network.resolver
    - network.interfaces
    - software.default
    {% if grains['os'] == 'CentOS' %}
    - firewalld
    {% endif %}
  '* and not lost*':
    - logstash_forwarder
  '* and not G@virtual:openvzve':
    - tinc
  'core*':
    - salt.master
    - salt.formulas
    - salt.ssh
    - salt.cloud
    - bind
    - bind.config
  'dock*':
    - docker-pkg
  'gate*':
    - gate-cfg
    - nginx.ng
    - nginx.ng.install
    - nginx.ng.config
    - nginx.ng.service
    - nginx.ng.vhosts_config
    - nginx.ng.vhosts
  'else*':
    - java
    - elasticsearch
  'lost*':
    - logstash
