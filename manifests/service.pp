class patoni::service {

  service { 'patroni':
    ensure => $patroni::service_ensure,
    enable => $patroni::service_enable,
  }

}
