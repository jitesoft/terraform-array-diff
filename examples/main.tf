module "array_diff" {
  source = "../"
  list1  = ["abc", "123", "hij", "klm"]
  list2  = ["abc", "534", "hij", "aaaa", "lll"]
}

output "result" {
  value = "${module.array_diff.result}"
}

# result = [
#   123,
#   534,
#   aaaa,
#   klm,
#   lll
# ]
