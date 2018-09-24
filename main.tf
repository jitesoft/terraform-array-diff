data "external" "array_diff" {
  program = [ "${var.shell}", "${path.module}/diff.sh" ]
  query {
    list1 = "${length(var.list1) > 0 ? join(",", var.list1) : ""}"
    list2 = "${length(var.list2) > 0 ? join(",", var.list2) : ""}"
  }
}
