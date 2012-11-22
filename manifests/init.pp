class ssh(
  $ports = "22",
  $users = "",
) {

  include ssh::params, ssh::install, ssh::config, ssh::service

}

