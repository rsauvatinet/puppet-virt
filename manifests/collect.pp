#
class virt::collect (
  $cluster_name = 'default',
  $ids = $facts['openvz_ids'],
) {

  $ids.each | $id | {
    Virt <<| tag == "virt_cluster_${cluster_name}" and id == $id |>>
  }
}
