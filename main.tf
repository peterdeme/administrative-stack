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

resource "spacelift_context" "ctx1" {
  name     = "Context in childspace2"
  space_id = "sibling2grand1-01K80HZZME2Z1SPYJ02MK1JP2W"
}
