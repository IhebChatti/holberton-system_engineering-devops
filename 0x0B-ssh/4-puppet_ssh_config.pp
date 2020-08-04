# puppet manifest to update ~/.ssh/config file

file { '~/.ssh/config'
  ensure  => 'file',
  path    => '~/.ssh/config',
  mode    => '600',
  content => 'Host 34.75.254.10\n
	IdentityFile ~/.ssh/holberton\n
	PasswordAuthentication no',
}
