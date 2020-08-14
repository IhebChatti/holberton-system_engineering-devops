#puppet manifest to install Nginx web server

exec { 'update':
  command  => '/usr/bin/apt-get update',
}
-> package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

-> file_line { '301 Moved Permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=0MW0mDZysxc permanent;',
}

-> file_line { 'X-Served-By':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By ${hostname};',
}

-> exec { 'Holberton School':
  command  => 'sudo echo "Holberton School" | sudo tee /usr/share/nginx/html/index.html',
  provider => 'shell',
}

-> service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
