class ssh::config {

  $ssh_users = $ssh::users
  $ssh_ports = $ssh::ports
  $ssh_allow_password = $ssh::allow_password
  $ssh_allow_root = $ssh::allow_root

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
