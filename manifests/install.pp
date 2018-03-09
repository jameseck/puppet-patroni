# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python modules
  include python

  python::pip { 'psycopg2-binary':
    path => "${patroni::postgres_bindir}:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin",
  }
  -> python::pip { 'patroni':
    install_args => "--install-option=\"${patroni::config_datastore}\"",
    path         => "${patroni::postgres_bindir}:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin",
  }

}
