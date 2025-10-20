terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://peterdeme.app.spacelift.tf"
}

resource "spacelift_context" "ctx" {
  description = "A context made in the tf provider"
  name        = "Context from TF provider"
  space_id    = "childspace1-01K71Y0MKV30KCCMPJQ32783RW"
}
