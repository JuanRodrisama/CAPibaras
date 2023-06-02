terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.24.0"
    }
  }
}

# Declaring the first provider to be only used for creating the cloud-stack
provider "grafana" {
  alias         = "first"
  
cloud_api_key   = "eyJrIjoiMmY2NTc2MGU2N2QwZDNmOTllOTgyMDQ0NTc0ZGQwNTAzYjc5YTI2MSIsIm4iOiJDQVBpYmFyYXNLZXkxIiwiaWQiOjg2OTY0OX0="
}

resource "grafana_cloud_stack" "capibaras" {
  provider    = grafana.first

  name        = "CAPibaras"
  slug        = "capibaras"
  region_slug = "eu" # Example “us”,”eu” etc
}

# Creating an API key in Grafana instance to be used for creating resources in Grafana instance
resource "grafana_api_key" "CAPibarasKey" {
  provider = grafana.first

  cloud_stack_slug = grafana_cloud_stack.capibaras.slug
  name             = "CAPibarasKey"
  role             = "Admin"
}

# Declaring the second provider to be used for creating resources in Grafana
provider "grafana" {
  alias         = "second"

  url  = grafana_cloud_stack.capibaras.url
  auth = grafana_api_key.CAPibarasKey.key
}