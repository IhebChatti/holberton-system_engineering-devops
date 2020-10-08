#puppet manifest to fix nginx Ulimit

exec { 'change Ulimit':
  command => 'sed -i \'s/^ULIMIT=.*/ULIMIT="-n 4096"/g\' /etc/default/nginx',
  path    => '/bin/',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
