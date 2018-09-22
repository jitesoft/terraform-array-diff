output "result" {
  description = "Resulting difference as a list."
  value       = "${split(",", data.external.array_diff.result.diff)}"
}
