master-grant:
  cmd.run:
    - name: /usr/local/mysql/bin/mysql -e "grant replication slave,super on *.* to 'repl'@'192.168.47.161' identified by 'repl123!';flush privileges;"
