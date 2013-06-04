class passenger::install::debian {

  package { 'passenger':
    ensure  => installed,
    name    => 'libapache2-mod-passenger',
    require => Package['httpd'],
    before  => Service['httpd'],
  }

  # Enable RequestHeaders
  exec { 'enable-headers':
    command => '/usr/sbin/a2enmod headers',
    creates => '/etc/apache2/mods-enabled/headers.load',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

}
