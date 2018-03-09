# @api_private
# This class handles patroni installation.
class patroni::install {

  # install python pip and install patroni python modules
  include python

  case $patroni::config_datastore {
    'consul': {
      $patroni_backend_egg = 'python-consul'
    }
    'etc': {
      $patroni_backend_egg = 'python-etcd'
    }
    default: {
      fail("Unsupported Patroni datastore ${patroni::config_datastore}")
    }
  }

  python::pip { 'psycopg2-binary':
    path => "${patroni::postgres_bindir}:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin",
  }
  -> python::pip { $patroni_backend_egg:
    path    => "${patroni::postgres_bindir}:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin",
  }
  -> python::pip { 'patroni':
    path    => "${patroni::postgres_bindir}:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin",
  }

}

