terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://peterdeme.app.spacelift.io"
  api_key_id       = var.spacelift_api_key_id
  api_key_secret   = var.spacelift_api_key_secret
}

# Parent stack
resource "spacelift_stack" "infra" {
  name       = "Base infrastructure"
  repository = "terraform-teststack3"
  branch     = "main"
  autodeploy = true
}

# Child stack
resource "spacelift_stack" "app" {
  name       = "Application"
  repository = "terraform-teststack2"
  branch     = "main"
  autodeploy = true
}

# Create the parent-child dependency for run execution ordering
resource "spacelift_stack_dependency" "this" {
  stack_id            = spacelift_stack.app.id
  depends_on_stack_id = spacelift_stack.infra.id
}

# Trigger a run on the parent stack
resource "spacelift_run" "this" {
  stack_id = spacelift_stack.infra.id

  keepers = {
    branch = spacelift_stack.infra.branch
  }

  # Make sure the dependency exists before triggering the run
  depends_on = [
    spacelift_stack_dependency.this
  ]
}

# Create the destructor for the parent stack
resource "spacelift_stack_destructor" "infra" {
  stack_id = spacelift_stack.infra.id

  depends_on = [
    spacelift_stack_destructor.app
  ]
}

# Create the destructor for the child stack
resource "spacelift_stack_destructor" "app" {
  stack_id = spacelift_stack.app.id
}
