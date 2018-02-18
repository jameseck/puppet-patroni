# @api_private
# This class handles patroni service.
class patroni::service {

  file { '/lib/systemd/system/patroni.service':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('patroni/patroni.service.erb'),
  }
  ~> exec { '/bin/systemctl daemon-reload':
    refreshonly => true,
  }
  -> service { 'patroni':
    ensure => $patroni::service_ensure,
    enable => $patroni::service_enable,
  }

}
