data "external" "array_diff" {
  program = [ "${var.shell}", "${path.module}/diff.sh" ]
  query {
    list1 = "${join(",", var.list1)}"
    list2 = "${join(",", var.list2)}"
  }
}
