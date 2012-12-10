define ssh::user::home(
  $path       = '',
  $user_name  = '',
  $manage_ssh = true,
) {

  $home_path = $path ? {
    ''      => "/home/$user_name",
    default => $path,
  }

  File {
    ensure  => directory,
    group   => "bryanjswift",
    owner   => "bryanjswift",
    mode    => 0755,
  }

  file { $home_path:
    path    => $home_path,
    require => [Ssh::User[$user_name]],
  }

  if ($manage_ssh) {
    file { "$home_path/.ssh":
      path    => "$home_path/.ssh",
      require => [File[$home_path]],
    }
  }

}
