define ssh::user(
  $name      = "",
  $full_name = "",
  $groups    = [],
  $group     = false,
  $home_dir  = false,
  $password  = "",
) {

  if ($groups != []) {
    group { $groups:
      ensure => present,
    }
  }

  $group_name = $group ? {
    false   => $un,
    ""      => $un,
    default => $group,
  }

  user { $un:
    comment  => $full_name,
    groups   => $groups,
    group    => $group_name,
    home     => $home_dir,
    name     => $un,
    password => $password,
    shell    => "/bin/bash",
    require  => [Group[$groups]],
  }

  if ($home_dir) {
    ssh::user::home { $name:
      user_name => $name,
    }
  }

}
