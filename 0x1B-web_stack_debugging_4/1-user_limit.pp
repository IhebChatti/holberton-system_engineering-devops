exec { 'fix limits.conf for holberton user':
  command => 'sed -i \'s/^holberton hard nofile.*/holberton hard nofile 64000/g\' /etc/security/limits.conf',
  path    => '/bin/',
}

exec { 'fix limits.conf for holberton user':
  command => 'sed -i \'s/^holberton soft nofile.*/holberton soft nofile 64000/g\' /etc/security/limits.conf',
  path    => '/bin/',
}
