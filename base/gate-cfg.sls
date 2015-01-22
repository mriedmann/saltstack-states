policycoreutils:
  pkg.installed

policycoreutils-python:
  pkg.installed

httpd_can_network_connect:
  selinux.boolean:
    - value: True
    - persist: True
