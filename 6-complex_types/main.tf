terraform {

}

# collection type (with same element type)
variable "list" {
  type    = list(any)
  default = ["a", "b", 1] # # will be converted to string (the default type is the type of the first element)
}

variable "map" {
  type = map(any)
  default = {
    "a" = "first"
    "b" = "second"
    "c" = "last"
  }
}

# structural type (with different element types)
variable "mytuple" {
  type    = tuple([string, number, bool])
  default = ["hello", 22, false]
}

variable "plan" {
  type = object({
    name   = string
    amount = number
  })
  default = {
    "name"   = "plan_A"
    "amount" = 10
  }
}