{% set p = "docker-pkg_" %}

{{p}}pip:
  pkg.installed:
    - name: python-pip

{{p}}docker-py:
  pip.installed:
    - name: docker-py
    - require:
      - pkg: {{p}}pip

{{p}}iptables:
  pkg.installed:
    - name: iptables-services
  service.running:
    - name: iptables
    - required:
      - pkg: {{p}}iptables

{{p}}docker:
  pkg.installed:
    - name: docker
    - required:
      - service: {{p}}iptables
  service.running:
    - name: docker
    - required:
      - pkg: {{p}}docker
      - pip: {{p}}docker-py
