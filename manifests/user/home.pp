define ssh::user::home(
  $path       = '',
  $user_name  = '',
  $group_name = '',
  $manage_ssh = true,
) {

  $home_path = $path ? {
    ''      => "/home/$user_name",
    default => $path,
  }

  $gn = $group_name ? {
    ''      => $user_name,
    default => $group_name,
  }

  File {
    ensure => directory,
    group  => $gn,
    owner  => $user_name,
    mode   => 0755,
  }

  file { $home_path:
    path    => $home_path,
    require => [User[$user_name], Group[$gn]],
  }

  if ($manage_ssh) {
    file { "$home_path/.ssh":
      path    => "$home_path/.ssh",
      require => [File[$home_path]],
    }
  }

}
