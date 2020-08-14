#!/usr/bin/env bash
#puppet manifest to install Nginx web server

exec { 'update':
  command  => 'sudo apt-get update',
  provider => 'shell',
}
package { 'nginx':
  ensure => 'installed',
}

exec { 'HolbertonSchool':
  command  => 'sudo echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}

file_line { '301 Moved Permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=0MW0mDZysxc permanent;',
}

file_line { 'X-Served-By'
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default'
  after  => 'listen [::]:80 default_server;'
  line   => 'add_header X-Served-By $HOSTNAME;'
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
