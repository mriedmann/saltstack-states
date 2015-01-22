app_ldap_pki_cert:
  file.managed:
    - name: /etc/pki/r3i.local/certs/ldap.r3i.at.crt
    - source: salt://files/pki/r3i.local/certs/ldap.r3i.at.crt
    - user: nginx
    - group: root
    - mode: 400
    - makedirs: True

app_ldap_pki_key:
  file.managed:
    - name: /etc/pki/r3i.local/certs/ldap.r3i.at.key
    - source: salt://files/pki/r3i.local/certs/ldap.r3i.at.key
    - user: nginx
    - group: root
    - mode: 400
    - makedirs: True
