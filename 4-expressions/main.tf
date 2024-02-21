terraform {

}

# string expressions
variable "name" {
  type = string
}

locals {
  hello   = "Hello ${var.name} !"
  ifhello = " %{if var.name == "Goku"} Hello %{else} Goodbye %{endif} !"
  isgoku  = var.name == "Goku" ? "Yes" : "No"
}


# for expression
variable "words" {
  type = list(any)
}

locals {
  local_tuple = [for w in var.words : upper(w)]
  local_map   = { for k, w in var.words : k => upper(w) }

  local_tuple_filtered = [for w in var.words : upper(w) if w != "apply"]
}

# splat expression
variable "words_splat" {
  type = list(any)
}

locals {
  local_for = [for m in var.words_splat : m.word]
  local_splat = var.words_splat[*].word
}


