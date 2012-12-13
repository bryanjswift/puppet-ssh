define ssh::user(
  $full_name = '',
  $group     = '',
  $groups    = [],
  $home_dir  = '',
  $name      = '',
  $password  = '',
  $rules     = undef,
) {

  if ($groups != []) {
    group { $groups:
      ensure => present,
    }
  }

  $group_name = $group ? {
    ''      => $name,
    default => $group,
  }

  group { $group_name:
    ensure => present,
  }

  user { $name:
    comment  => $full_name,
    groups   => $groups,
    gid      => $group_name,
    home     => $home_dir,
    name     => $name,
    password => $password,
    shell    => '/bin/bash',
    require  => [Group[$groups]],
  }

  if ($home_dir == true) {
    ssh::user::home { $name:
      user_name  => $name,
      group_name => $group_name,
    }
  } elsif ($home_dir) {
    ssh::user::home { $name:
      path       => $home_dir,
      user_name  => $name,
      group_name => $group_name,
    }
  }

  if ($rules) {
    augeas { "sshd_match_user_${name}":
      context => "/files${ssh::params::service_config}",
      changes => template('ssh/sshd_config_match_user.erb'),
      require => [Class['ssh::config']],
      notify  => [Class['ssh::service']],
    }
  }

}
