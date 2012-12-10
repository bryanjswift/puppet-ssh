class ssh::config {

  $ssh_users = $ssh::users
  $ssh_ports = $ssh::ports

  file { "sshd_config":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0600,
    path    => $ssh::params::service_config,
    content => template("ssh/sshd_config.erb"),
    require => Class["ssh::install"],
    notify  => Class["ssh::service"],
  }

}