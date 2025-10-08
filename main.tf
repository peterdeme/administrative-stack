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
  space_id = "childspace2-01K71X37VCMF9D6W1SZRG8EGBE"
}
