class ssh(
  $allow_password = "yes",
  $allow_root     = "no",
  $ports          = "22",
  $users          = "",
) {

  include ssh::params, ssh::install, ssh::config, ssh::service

}

