exec { 'change user limit':
  command => 'sed -i \'s/^holberton hard nofile.*/holberton hard nofile 64000/g\' /etc/security/limits.conf',
  path    => '/bin/',
}

exec { 'change user limit':
  command => 'sed -i \'s/^holberton soft nofile.*/holberton soft nofile 64000/g\' /etc/security/limits.conf',
  path    => '/bin/',
}
