# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python modules
  include python

  python::pip { 'psycopg2-binary': }
  python::pip { 'patroni': }
  python::pip { 'patroni':
    install_args => $patroni::config_datastore,
  }

}
