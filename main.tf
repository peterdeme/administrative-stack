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

# Parent stack
resource "spacelift_stack" "infra" {
  name       = "Base infrastructure from TF Provider"
  repository = "terraform-testack2"
  branch     = "main"
  autodeploy = true
}

resource "spacelift_space" "development" {
  name = "Space from TF module"
  parent_space_id = "root"
  description = "This a child of the root space - made in a TF module"
}

resource "spacelift_context" "ctx" {
  description = "A context made in the tf provider"
  name        = "Context from TF provider"
}
