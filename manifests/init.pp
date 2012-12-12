class ssh(
  $allow_password = "yes",
  $allow_root     = "no",
  $ports          = "22",
  $users          = "",
) {

  validate_re($allow_password, '^(yes|no)$',
    "${allow_password} is not supported for allow_password. Allowed values are 'yes' and 'no'.")

  validate_re($allow_root, '^(yes|no)$',
    "${allow_root} is not supported for allow_root. Allowed values are 'yes' and 'no'.")

  include ssh::params, ssh::install, ssh::config, ssh::service

}

