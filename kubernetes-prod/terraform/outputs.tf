output "master_external_ip_address" {
  value = yandex_compute_instance.master[*].network_interface[0].nat_ip_address
}
output "master_internal_ip_address" {
  value = yandex_compute_instance.master[*].network_interface[0].ip_address
}
output "node-0_name" {
  value = yandex_compute_instance.nodes[0].name
}
output "node-1_name" {
  value = yandex_compute_instance.nodes[1].name
}
output "node-2_name" {
  value = yandex_compute_instance.nodes[2].name
}
output "node-0_ip_address" {
  value = yandex_compute_instance.nodes[0].network_interface[0].ip_address
}
output "node-1_ip_address" {
  value = yandex_compute_instance.nodes[1].network_interface[0].ip_address
}
output "node-2_ip_address" {
  value = yandex_compute_instance.nodes[2].network_interface[0].ip_address
}