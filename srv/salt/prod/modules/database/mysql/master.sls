/etc/my.cnf.d/master.cnf:
  file.managed:
    - source: salt://modules/database/mysql/files/master.cnf
    - name: /etc/my.cnf
    - user: root
    - group: root
    - mode: '0644'

master-service:
  service.running:
    - name: mysqld.service
    - enable: true
    - reload: true
    - watch:
      - file: /etc/my.cnf.d/master.cnf 
