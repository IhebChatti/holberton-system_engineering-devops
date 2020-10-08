#puppet manifest to fix nginx Ulimit

exec { 'change Ulimit':
  command => 'sed -i \'s/^ULIMIT=.*/ULIMIT="-n 4096"/g\' /etc/default/nginx',
  path    => '/bin/',
}

exec { 'nginx restart':
  command => '/usr/bin/sudo service nginx restart',
  path    => '/usr/sbin/',
}
