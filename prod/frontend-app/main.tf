module "frontend" {
  source = "git::git@github.com:swatro/terraform-tutorial.git//modules/frontend-app?ref=v0.0.1"

  min_size = 2
  max_size = 10
}
