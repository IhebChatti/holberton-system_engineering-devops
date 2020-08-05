#!/usr/bin/env bash
#Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure   => 'installed',
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
  after  => 'server_name _;',
  line   => 'rewrite ^/redirect_me http://www.newdomain.com/newlocation permanent;',
}
