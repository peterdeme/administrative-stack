terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://peterdeme.app.spacelift.io"
}

resource "random_pet" "pet1" {
  length = 10
}

resource "spacelift_context" "ctx1" {
  name     = "Context - ${random_pet.pet1.id}"
  space_id = "sibling1-01K80HXRZHWHQYFREDD20HN2Y0"
}

#resource "spacelift_policy" "no-weekend-deploys" {
#  name = "Policy ${random_pet.pet1.id}"
#  body = "package spacelift"
#  type = "PLAN"
#  space_id = "dev-01JZT84P5N16MKWSAVYWMFAAB1"
#}

#data "terraform_remote_state" "deepthought" {
#  backend = "remote"

#  config = {
#    hostname     = "spacelift.io"
#    organization = "peterdeme"

#    workspaces = {
#      name = "dev"
#    }
#  }
#}

#output "ultimate_answer" {
#  value = data.terraform_remote_state.deepthought.outputs.name
#}
