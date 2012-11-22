class ssh::service {
  service { "sshd":
    enable     => true,
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    name       => $ssh::params::service_name,
    require    => Class["ssh::config"],
  }
}

