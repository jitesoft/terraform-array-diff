output "result" {
  value = "${split(",", data.external.array_diff.result.diff)}"
}
