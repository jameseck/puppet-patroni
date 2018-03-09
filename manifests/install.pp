# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python modules
  include python

  python::pip { 'psycopg2-binary':
    environment => 'PATH=/usr/pgsql-9.6/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin',
  }
  -> python::pip { 'patroni':
    install_args => "--install-option=\"${patroni::config_datastore}\"",
  }

}
