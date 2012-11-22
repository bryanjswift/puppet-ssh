class ssh::params {
  case $::operatingsystem {
    Solaris: {
      $package_name   = "openssh"
      $service_config = "/etc/ssh/sshd_config"
      $service_name   = "sshd"
    }
    /(Ubuntu|Debian)/: {
      $package_name   = "openssh-server"
      $service_config = "/etc/ssh/sshd_config"
      $service_name   = "ssh"
    }
    /(RedHat|CentOS|Fedora)/: {
      $package_name   = "openssh-server"
      $service_config = "/etc/ssh/sshd_config"
      $service_name   = "sshd"
    }
  }
}
