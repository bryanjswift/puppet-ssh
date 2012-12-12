class ssh::config {

  $ssh_allow_password = $ssh::allow_password
  $ssh_allow_root = $ssh::allow_root
  $ssh_ports = $ssh::ports
  $ssh_users = $ssh::users

  /* This needs to be thought through a bit more
   * I'm not sure how reliant on the defaults I want to be * /
  augeas { "sshd_config":
    context  => "/files/${ssh::params::service_config}",
    template => template('ssh/sshd_config_augeas.erb'),
    require => Class["ssh::install"],
    notify  => Class["ssh::service"],
  }
  /* End thinking time code */

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
