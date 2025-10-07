terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://peterdeme.app.spacelift.dev"
}

resource "spacelift_context" "ctx1" {
  name     = "Context in Root Space"
  space_id = "root"
}

resource "spacelift_context" "ctx2" {
  name     = "Context from TF provider"
  space_id = "childspace1-01K6ZAB2HY2B7NJFXEER0J39YD"
}
