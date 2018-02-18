# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python modules
  include python

  python::pip { 'patroni': }
  python::pip { "patroni[${patroni::config_datastore}]": }

}
