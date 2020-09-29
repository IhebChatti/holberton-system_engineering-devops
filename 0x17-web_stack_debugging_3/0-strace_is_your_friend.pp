# puppet manifest to replace phpp with php in wp-setting

exec { 'replace phpp by php':
  command => 'sed -i.bak \'s|phpp|php|g\' /var/www/html/wp-settings.php',
  path    => '/bin/',
}
