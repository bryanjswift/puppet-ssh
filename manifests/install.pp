class ssh::install {
  #$package_name = $::operatingsystem ? {
  #  /(Red Hat|CentOS|Fedora|Ubuntu|Debian)/ => "openssh-server",
  #  Solaris                                 => "openssh",
  #  default                                 => "ssh",
  #}

  package { "ssh":
    ensure => installed,
    name   => $ssh::params::package_name
  }
}

