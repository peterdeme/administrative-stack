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

resource "spacelift_user" "test" {
  invitation_email = "joeexotic+1@spacelift.io"
  username         = "peterdtest"
  policy {
    space_id = "root"
    role     = "ADMIN"
  }

  policy {
    space_id = "root"
    role     = "READ"
  }

  policy {
    space_id = "root"
    role     = "WRITE"
  }
}

# Parent stack
# resource "spacelift_stack" "infra" {
#   name       = "Base infrastructure"
#   repository = "terraform-testack3"
#   branch     = "main"
#   autodeploy = true
# }
