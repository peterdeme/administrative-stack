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
}

resource "spacelift_context" "ctx1" {
  name     = "Context ${random_pet.pet1.id}"
  space_id = "sibling2-01K80HYFVQE1KX57Z628KDE9XJ"
}

resource "spacelift_policy" "no-weekend-deploys" {
  name = "Policy ${random_pet.pet1.id}"
  body = "package spacelift"
  type = "PLAN"
}
