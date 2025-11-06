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
  length = 3
}

resource "spacelift_context" "ctx1" {
  name     = "Context - ${random_pet.pet1.id}"
  space_id = "sibling2-01K80HYFVQE1KX57Z628KDE9XJ"
}

 resource "spacelift_stack" "stack1" {
  branch     = "main"
  name       = "Stack - ${random_pet.pet1.id}"
  repository = "empty"
  space_id   = "sibling2-01K80HYFVQE1KX57Z628KDE9XJ"
}
