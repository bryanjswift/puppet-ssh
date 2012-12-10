define ssh::user::home(
  $user_name  => "",
  $home_path  => "",
  $manage_ssh => true,
) {

  if ($home_path != "") {
    $hp = $home_path
  } else {
    $hp = "/home/$user_name"
  }

  File {
    ensure  => directory,
    group   => "bryanjswift",
    owner   => "bryanjswift",
    mode    => 0755,
  }

  file { $hp:
    path    => $hp,
    require => [Ssh::User[$user_name]],
  }

  if ($manage_ssh) {
    file { "$hp/.ssh":
      path    => "$hp/.ssh",
      require => [File[$hp]],
    }
  }

}
