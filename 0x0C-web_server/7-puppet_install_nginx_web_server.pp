#!/usr/bin/env bash
#Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => 'installed',
}

exec { 'Holberton school':
  command  => 'sudo echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

file_line { '301 Moved Permanently'
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=0MW0mDZysxc permanent;',
}
