# == Class: gnocchi::config
#
# This class is used to manage arbitrary gnocchi configurations.
#
# === Parameters
#
# [*gnocchi_config*]
#   (optional) Allow configuration of arbitrary gnocchi configurations.
#   The value is an hash of gnocchi_config resources. Example:
#   { 'DEFAULT/foo' => { value => 'fooValue'},
#     'DEFAULT/bar' => { value => 'barValue'}
#   }
#   In yaml format, Example:
#   gnocchi_config:
#     DEFAULT/foo:
#       value: fooValue
#     DEFAULT/bar:
#       value: barValue
#
#   NOTE: The configuration MUST NOT be already handled by this module
#   or Puppet catalog compilation will fail with duplicate resources.
#
class gnocchi::config (
  $gnocchi_config        = {},
) {

  include ::gnocchi::deps

  validate_hash($gnocchi_config)

  create_resources('gnocchi_config', $gnocchi_config)
}
