

output "local_string" {
  value = [local.hello, local.isgoku, local.ifhello]
}
output "local_for" {
  value = [local.local_tuple, local.local_map, local.local_tuple_filtered]
}

output "local_splat" {
  value = [local.local_for,local.local_splat]
}


