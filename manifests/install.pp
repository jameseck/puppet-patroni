# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python module
  include python

  python::pip { 'patroni': }
  python::pip { "patroni[${patroni::config_datastore}]": }

}
