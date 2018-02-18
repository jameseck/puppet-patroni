# patroni
#
# Main class, includes all other classes.
#
# @param config_hash
#   A hash of the config options for Patroni.
#
# @param config_file
#   The path to the Patroni config file. Default value: '/etc/patroni/patroni.yaml'.
#
# @param service_enable
#   Whether to enable the Patroni service at boot. Default value: true.
#
# @param service_ensure
#   Whether the Patroni service should be running. Default value: 'running'.
#
# @param postgres_user
#   The postgres user.  Default value: 'postgres'.
#
# @param postgres_group
#   The postgres group.  Default value: 'postgres'.
#

class patroni (
  Hash $config_hash,
  Boolean $config_merge,
  Stdlib::Absolutepath $config_file,
  Boolean $service_enable,
  Enum['running', 'stopped'] $service_ensure,
  String $postgres_user,
  String $postgres_group,
  String $postgres_superuser,
  String $postgres_superpass,
  String $postgres_replication_user,
  String $postgres_replication_pass,
  String $scope,
  Stdlib::Absolutepath $postgres_bindir,
  Stdlib::Absolutepath $postgres_datadir,
  Enum['consul', 'etcd'] $config_datastore,
  String $config_datastore_host,
) {

  contain patroni::install
  contain patroni::config
  contain patroni::service

  Class['patroni::install']
  -> Class['patroni::config']
  ~> Class['patroni::service']

}
