class ssh::config {

  $ssh_allow_password = $ssh::allow_password
  $ssh_allow_root = $ssh::allow_root
  $ssh_ports = $ssh::ports
  $ssh_users = $ssh::users

  augeas { "sshd_config":
    context => "/files${ssh::params::service_config}",
    changes => template('ssh/sshd_config_augeas.erb'),
    require => Class["ssh::install"],
    notify  => Class["ssh::service"],
  }

}
