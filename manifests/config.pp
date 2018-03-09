# @api_private
# This class handles patroni config.
class patroni::config {

  file { '/etc/patroni':
    ensure => directory,
    owner  => $patroni::postgres_user,
    group  => $patroni::postgres_group,
    mode   => '0700',
  }

  if ( $patroni::config_merge ) {
    $_config_hash = lookup('patroni::config_hash', { merge => { 'strategy' => 'deep'} } )
  } else {
    $_config_hash = lookup('patroni::config_hash')
  }

  file { $patroni::config_file:
    ensure  => 'file',
    owner   => $patroni::postgres_user,
    group   => $patroni::postgres_group,
    mode    => '0600',
    content => inline_template('<%= @_config_hash.to_yaml %>')
  }

  file { '/root/.config':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }
  file { '/root/.config/patroni':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }
  file { '/root/.config/patroni/patronictl.yaml':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => "{dcs_api: '${patroni::config_datastore}://${patroni::config_datastore_host}', namespace: /service/}",

}
