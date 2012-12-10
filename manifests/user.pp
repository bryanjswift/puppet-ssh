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

  if (!$user_name) {
    $un = $name
  } else {
    $un = $user_name
  }

  user { $un:
    comment  => $full_name,
    groups   => $groups,
    home     => $home_dir,
    name     => $un,
    password => $password,
    shell    => "/bin/bash",
    require  => [Group[$groups]],
  }

}
