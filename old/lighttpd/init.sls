lighttpd_pkg:
  pkg.installed:
    - name: lighttpd

lighttpd_service:
  service.running:
    - name: lighttpd
    - required:
      - pkg: lighttpd_pkg
    - watch:
      - file: lighttpd_config

lighttpd_config:
  file.managed:
    - name: /etc/lighttpd/lighttpd.conf
    - source: salt://lighttpd/files/lighttpd.conf
    - user: root
    - group: root
    - mode: 644
