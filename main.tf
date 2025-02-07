terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://peterdeme.app.spacelift.dev"
  # api_key_id       = var.spacelift_api_key_id
  # api_key_secret   = var.spacelift_api_key_secret
}

# Parent stack
resource "spacelift_stack" "infra" {
  name       = "Base infrastructure from TF Provider"
  repository = "terraform-testack3"
  branch     = "main"
  autodeploy = true
}
