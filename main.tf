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

# Parent stack
resource "spacelift_stack" "infra" {
  name       = "Base infrastructure from TF Provider"
  repository = "terraform-testack3"
  branch     = "main"
  autodeploy = true
}
