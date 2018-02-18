# @api_private
# This class handles patroni config.
class patroni::config {

  file { '/etc/patroni':
    ensure => directory,
    owner  => $patroni::postgres_user,
    group  => $patroni::postgres_group,
    mode   => '0700',
  }

  $_config_hash = $patroni::config_hash

  file { $patroni::config_file:
    ensure  => 'file',
    owner   => $patroni::postgres_user,
    group   => $patroni::postgres_group,
    mode    => '0600',
    content => inline_template('<%= @_config_hash.to_yaml %>')
  }

}
