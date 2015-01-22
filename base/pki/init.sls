/etc/pki/r3i.local/r3i.local_ca_cert.crt:
  file.managed:
    - source: salt://files/pki/r3i.local/r3i.local_ca_cert.crt
    - user: root
    - group: root
    - mode: 400
    - makedirs: True
