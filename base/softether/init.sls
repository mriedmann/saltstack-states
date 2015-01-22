softether:
  pkg.installed:
    - sources:
      - softethervpn: http://projects.thepoch.com/softethervpn/7/x86_64/softethervpn-4.11.9506-1.el7.centos.x86_64.rpm 

softether_service_stopped:
  service.dead:
    - name: vpnserver

softether_service_running:
  service.running:
    - name: vpnserver
    - required:
      - pkg: softether
    - watch:
      - file: softether_config

softether_config:
  file.managed:
    - name: /usr/vpnserver/vpn_server.config
    - source: salt://softether/files/vpn_server.config
    - required:
      - service: softether_server_stopped

