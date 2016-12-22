#
class virt::export (
  $params = {},
  $profile = undef,
  $profile_defaults = {},
  $cluster_name = 'default',
) {

  $defaults = has_key($profile_defaults, $profile) ? {
    true  => $profile_defaults[$profile],
    false => {},
  }

  @@virt{ $facts['fqdn']:
    *   => merge($defaults, $params),
    tag => "virt_cluster_${cluster_name}",
  }
}
