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
  name     = "Context in childspace2"
  space_id = "grandgrandchild2-2-01K72RX71H03GQ94ZW1N7NTVSW"
}
