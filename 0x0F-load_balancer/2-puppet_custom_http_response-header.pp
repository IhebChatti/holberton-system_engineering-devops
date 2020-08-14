#puppet manifest to install Nginx web server

exec { 'update':
  command  => '/usr/bin/apt-get update',
}
-> package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

-> file { '/var/www/html/index.html':
  content => 'Holberton School',
}

-> file_line { '301 Moved Permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=0MW0mDZysxc permanent;',
}

-> file_line { 'X-Served-By':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By ${HOSTNAME};',
}

-> service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
