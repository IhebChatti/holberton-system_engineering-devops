#!/usr/bin/env bash
#puppet manifest to install Nginx web server

package { 'nginx':
  ensure => 'installed',
}

exec { 'HolbertonSchool':
  command  => 'sudo echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}

file_line { '301 Moved Permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=0MW0mDZysxc permanent;',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
