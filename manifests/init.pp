class ssh(
  $allow_password = "yes",
  $ports          = "22",
  $users          = "",
) {

  include ssh::params, ssh::install, ssh::config, ssh::service

}

